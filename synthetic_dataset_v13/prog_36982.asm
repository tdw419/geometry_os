; DESCRIPTION: Renders a orange box of size 114x77 starting at (190, 53).
; PLAN: r0=190(x), r1=53(y), r2=114(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 53
LDI r2, 114
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
