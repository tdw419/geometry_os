; DESCRIPTION: Renders a orange box of size 95x26 starting at (147, 166).
; PLAN: r0=147(x), r1=166(y), r2=95(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 166
LDI r2, 95
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
