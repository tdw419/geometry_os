; DESCRIPTION: Renders a orange box of size 118x118 starting at (288, 66).
; PLAN: r0=288(x), r1=66(y), r2=118(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 66
LDI r2, 118
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
