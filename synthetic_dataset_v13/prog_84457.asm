; DESCRIPTION: Draws a purple rectangle at (302, 213) with width 103 and height 23.
; PLAN: r0=302(x), r1=213(y), r2=103(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 213
LDI r2, 103
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
