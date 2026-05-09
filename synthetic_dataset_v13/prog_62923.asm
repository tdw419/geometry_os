; DESCRIPTION: Renders a orange box of size 107x36 starting at (184, 147).
; PLAN: r0=184(x), r1=147(y), r2=107(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 147
LDI r2, 107
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
