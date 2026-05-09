; DESCRIPTION: Draws a black rectangle at (120, 113) with width 21 and height 50.
; PLAN: r0=120(x), r1=113(y), r2=21(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 113
LDI r2, 21
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
