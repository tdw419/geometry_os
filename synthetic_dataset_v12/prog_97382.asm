; DESCRIPTION: Draws a cyan rectangle at (159, 172) with width 91 and height 21.
; PLAN: r0=159(x), r1=172(y), r2=91(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 172
LDI r2, 91
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
