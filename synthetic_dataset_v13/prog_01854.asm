; DESCRIPTION: Renders a orange box of size 52x59 starting at (430, 58).
; PLAN: r0=430(x), r1=58(y), r2=52(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 58
LDI r2, 52
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
