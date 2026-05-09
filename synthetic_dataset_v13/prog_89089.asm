; DESCRIPTION: Renders a orange box of size 60x89 starting at (194, 83).
; PLAN: r0=194(x), r1=83(y), r2=60(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 83
LDI r2, 60
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
