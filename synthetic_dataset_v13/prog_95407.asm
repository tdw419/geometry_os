; DESCRIPTION: Draws a orange rectangle at (147, 237) with width 65 and height 12.
; PLAN: r0=147(x), r1=237(y), r2=65(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 237
LDI r2, 65
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
