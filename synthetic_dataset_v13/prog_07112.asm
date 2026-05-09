; DESCRIPTION: Renders a orange box of size 56x95 starting at (427, 50).
; PLAN: r0=427(x), r1=50(y), r2=56(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 50
LDI r2, 56
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
