; DESCRIPTION: Renders a orange box of size 22x118 starting at (342, 74).
; PLAN: r0=342(x), r1=74(y), r2=22(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 74
LDI r2, 22
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
