; DESCRIPTION: Renders a orange box of size 101x100 starting at (408, 147).
; PLAN: r0=408(x), r1=147(y), r2=101(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 147
LDI r2, 101
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
