; DESCRIPTION: Renders a orange box of size 23x97 starting at (323, 138).
; PLAN: r0=323(x), r1=138(y), r2=23(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 138
LDI r2, 23
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
