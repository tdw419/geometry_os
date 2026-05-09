; DESCRIPTION: Creates a blue rectangular region at (40, 37) spanning 25 by 15 pixels.
; PLAN: r0=40(x), r1=37(y), r2=25(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 37
LDI r2, 25
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
