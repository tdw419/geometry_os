; DESCRIPTION: Creates a blue rectangular region at (427, 10) spanning 25 by 114 pixels.
; PLAN: r0=427(x), r1=10(y), r2=25(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 10
LDI r2, 25
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
