; DESCRIPTION: Draws a green rectangle at (245, 134) with width 100 and height 83.
; PLAN: r0=245(x), r1=134(y), r2=100(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 134
LDI r2, 100
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
