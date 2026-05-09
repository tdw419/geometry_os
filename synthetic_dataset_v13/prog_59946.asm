; DESCRIPTION: Renders a orange box of size 92x118 starting at (10, 87).
; PLAN: r0=10(x), r1=87(y), r2=92(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 87
LDI r2, 92
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
