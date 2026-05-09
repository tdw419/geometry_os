; DESCRIPTION: Renders a blue box of size 87x105 starting at (116, 34).
; PLAN: r0=116(x), r1=34(y), r2=87(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 34
LDI r2, 87
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
