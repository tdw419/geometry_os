; DESCRIPTION: Draws a green rectangle at (211, 159) with width 17 and height 50.
; PLAN: r0=211(x), r1=159(y), r2=17(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 159
LDI r2, 17
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
