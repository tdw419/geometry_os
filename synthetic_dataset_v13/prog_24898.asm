; DESCRIPTION: Draws a purple rectangle at (229, 69) with width 86 and height 48.
; PLAN: r0=229(x), r1=69(y), r2=86(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 69
LDI r2, 86
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
