; DESCRIPTION: Draws a purple rectangle at (187, 164) with width 115 and height 66.
; PLAN: r0=187(x), r1=164(y), r2=115(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 164
LDI r2, 115
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
