; DESCRIPTION: Renders a orange box of size 85x89 starting at (297, 73).
; PLAN: r0=297(x), r1=73(y), r2=85(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 73
LDI r2, 85
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
