; DESCRIPTION: Renders a orange box of size 52x112 starting at (138, 79).
; PLAN: r0=138(x), r1=79(y), r2=52(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 79
LDI r2, 52
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
