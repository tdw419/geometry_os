; DESCRIPTION: Renders a orange box of size 48x12 starting at (119, 147).
; PLAN: r0=119(x), r1=147(y), r2=48(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 147
LDI r2, 48
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
