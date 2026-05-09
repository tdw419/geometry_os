; DESCRIPTION: Draws a orange rectangle at (320, 147) with width 30 and height 96.
; PLAN: r0=320(x), r1=147(y), r2=30(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 147
LDI r2, 30
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
