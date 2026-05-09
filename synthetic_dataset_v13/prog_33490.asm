; DESCRIPTION: Renders a orange box of size 20x81 starting at (147, 12).
; PLAN: r0=147(x), r1=12(y), r2=20(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 12
LDI r2, 20
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
