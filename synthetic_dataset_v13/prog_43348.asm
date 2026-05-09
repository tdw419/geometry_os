; DESCRIPTION: Renders a blue box of size 105x23 starting at (116, 162).
; PLAN: r0=116(x), r1=162(y), r2=105(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 162
LDI r2, 105
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
