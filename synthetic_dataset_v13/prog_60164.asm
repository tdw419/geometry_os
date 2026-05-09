; DESCRIPTION: Draws a blue rectangle at (121, 187) with width 68 and height 32.
; PLAN: r0=121(x), r1=187(y), r2=68(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 187
LDI r2, 68
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
