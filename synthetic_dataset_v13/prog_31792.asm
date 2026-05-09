; DESCRIPTION: Draws a purple rectangle at (307, 127) with width 119 and height 48.
; PLAN: r0=307(x), r1=127(y), r2=119(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 127
LDI r2, 119
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
