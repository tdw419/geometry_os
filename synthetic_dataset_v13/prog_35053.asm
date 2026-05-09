; DESCRIPTION: Draws a black rectangle at (434, 172) with width 50 and height 75.
; PLAN: r0=434(x), r1=172(y), r2=50(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 172
LDI r2, 50
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
