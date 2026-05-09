; DESCRIPTION: Renders a orange box of size 95x10 starting at (231, 52).
; PLAN: r0=231(x), r1=52(y), r2=95(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 52
LDI r2, 95
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
