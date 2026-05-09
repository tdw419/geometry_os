; DESCRIPTION: Draws a green rectangle at (320, 147) with width 76 and height 12.
; PLAN: r0=320(x), r1=147(y), r2=76(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 147
LDI r2, 76
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
