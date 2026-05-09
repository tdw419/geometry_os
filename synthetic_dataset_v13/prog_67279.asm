; DESCRIPTION: Draws a blue rectangle at (197, 71) with width 85 and height 104.
; PLAN: r0=197(x), r1=71(y), r2=85(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 71
LDI r2, 85
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
