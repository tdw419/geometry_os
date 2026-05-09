; DESCRIPTION: Draws a purple rectangle at (149, 165) with width 48 and height 58.
; PLAN: r0=149(x), r1=165(y), r2=48(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 165
LDI r2, 48
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
