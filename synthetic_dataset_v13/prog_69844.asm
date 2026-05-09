; DESCRIPTION: Renders a orange box of size 49x89 starting at (399, 87).
; PLAN: r0=399(x), r1=87(y), r2=49(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 87
LDI r2, 49
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
