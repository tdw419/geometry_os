; DESCRIPTION: Draws a purple rectangle at (208, 117) with width 30 and height 87.
; PLAN: r0=208(x), r1=117(y), r2=30(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 117
LDI r2, 30
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
