; DESCRIPTION: Creates a black rectangular region at (3, 4) spanning 22 by 111 pixels.
; PLAN: r0=3(x), r1=4(y), r2=22(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 4
LDI r2, 22
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
