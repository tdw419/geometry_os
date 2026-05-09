; DESCRIPTION: Draws a purple rectangle at (121, 47) with width 117 and height 91.
; PLAN: r0=121(x), r1=47(y), r2=117(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 47
LDI r2, 117
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
