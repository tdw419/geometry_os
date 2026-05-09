; DESCRIPTION: Draws a white rectangle at (172, 132) with width 25 and height 50.
; PLAN: r0=172(x), r1=132(y), r2=25(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 132
LDI r2, 25
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
