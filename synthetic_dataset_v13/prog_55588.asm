; DESCRIPTION: Draws a purple rectangle at (215, 79) with width 35 and height 71.
; PLAN: r0=215(x), r1=79(y), r2=35(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 79
LDI r2, 35
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
