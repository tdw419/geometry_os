; DESCRIPTION: Draws a purple rectangle at (411, 91) with width 48 and height 45.
; PLAN: r0=411(x), r1=91(y), r2=48(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 91
LDI r2, 48
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
