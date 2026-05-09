; DESCRIPTION: Renders a orange box of size 91x14 starting at (233, 52).
; PLAN: r0=233(x), r1=52(y), r2=91(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 52
LDI r2, 91
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
