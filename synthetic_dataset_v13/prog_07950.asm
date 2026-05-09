; DESCRIPTION: Draws a purple rectangle at (210, 95) with width 10 and height 104.
; PLAN: r0=210(x), r1=95(y), r2=10(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 95
LDI r2, 10
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
