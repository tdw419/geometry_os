; DESCRIPTION: Creates a blue rectangular region at (101, 104) spanning 26 by 25 pixels.
; PLAN: r0=101(x), r1=104(y), r2=26(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 104
LDI r2, 26
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
