; DESCRIPTION: Draws a purple rectangle at (345, 152) with width 110 and height 65.
; PLAN: r0=345(x), r1=152(y), r2=110(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 152
LDI r2, 110
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
