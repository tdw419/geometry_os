; DESCRIPTION: Creates a black rectangular region at (345, 111) spanning 20 by 102 pixels.
; PLAN: r0=345(x), r1=111(y), r2=20(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 111
LDI r2, 20
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
