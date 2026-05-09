; DESCRIPTION: Renders a orange box of size 52x80 starting at (150, 118).
; PLAN: r0=150(x), r1=118(y), r2=52(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 118
LDI r2, 52
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
