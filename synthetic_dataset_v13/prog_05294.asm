; DESCRIPTION: Draws a purple rectangle at (208, 24) with width 31 and height 13.
; PLAN: r0=208(x), r1=24(y), r2=31(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 24
LDI r2, 31
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
