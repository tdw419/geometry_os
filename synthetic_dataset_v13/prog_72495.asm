; DESCRIPTION: Renders a orange box of size 74x80 starting at (102, 119).
; PLAN: r0=102(x), r1=119(y), r2=74(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 119
LDI r2, 74
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
