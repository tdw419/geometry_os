; DESCRIPTION: Draws a purple rectangle at (330, 187) with width 35 and height 33.
; PLAN: r0=330(x), r1=187(y), r2=35(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 187
LDI r2, 35
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
