; DESCRIPTION: Draws a blue rectangle at (18, 50) with width 45 and height 117.
; PLAN: r0=18(x), r1=50(y), r2=45(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 50
LDI r2, 45
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
