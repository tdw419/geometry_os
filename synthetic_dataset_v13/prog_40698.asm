; DESCRIPTION: Draws a purple rectangle at (197, 10) with width 117 and height 104.
; PLAN: r0=197(x), r1=10(y), r2=117(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 10
LDI r2, 117
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
