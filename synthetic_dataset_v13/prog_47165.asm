; DESCRIPTION: Renders a orange box of size 58x79 starting at (323, 56).
; PLAN: r0=323(x), r1=56(y), r2=58(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 56
LDI r2, 58
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
