; DESCRIPTION: Renders a orange box of size 18x112 starting at (411, 85).
; PLAN: r0=411(x), r1=85(y), r2=18(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 85
LDI r2, 18
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
