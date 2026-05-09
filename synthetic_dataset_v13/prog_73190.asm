; DESCRIPTION: Renders a orange box of size 70x118 starting at (112, 48).
; PLAN: r0=112(x), r1=48(y), r2=70(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 48
LDI r2, 70
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
