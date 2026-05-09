; DESCRIPTION: Renders a orange box of size 68x89 starting at (74, 39).
; PLAN: r0=74(x), r1=39(y), r2=68(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 39
LDI r2, 68
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
