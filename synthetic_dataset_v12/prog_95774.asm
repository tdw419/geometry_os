; DESCRIPTION: Creates a black rectangular region at (26, 87) spanning 25 by 111 pixels.
; PLAN: r0=26(x), r1=87(y), r2=25(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 87
LDI r2, 25
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
