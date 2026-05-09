; DESCRIPTION: Renders a orange box of size 14x99 starting at (408, 52).
; PLAN: r0=408(x), r1=52(y), r2=14(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 52
LDI r2, 14
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
