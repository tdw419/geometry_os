; DESCRIPTION: Renders a blue box of size 100x41 starting at (116, 169).
; PLAN: r0=116(x), r1=169(y), r2=100(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 169
LDI r2, 100
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
