; DESCRIPTION: Draws a purple rectangle at (208, 126) with width 99 and height 120.
; PLAN: r0=208(x), r1=126(y), r2=99(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 126
LDI r2, 99
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
