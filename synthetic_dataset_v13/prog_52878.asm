; DESCRIPTION: Renders a orange box of size 88x66 starting at (323, 36).
; PLAN: r0=323(x), r1=36(y), r2=88(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 36
LDI r2, 88
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
