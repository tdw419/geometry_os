; DESCRIPTION: Draws a purple rectangle at (91, 21) with width 58 and height 75.
; PLAN: r0=91(x), r1=21(y), r2=58(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 21
LDI r2, 58
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
