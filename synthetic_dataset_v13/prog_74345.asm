; DESCRIPTION: Renders a blue box of size 85x58 starting at (68, 95).
; PLAN: r0=68(x), r1=95(y), r2=85(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 95
LDI r2, 85
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
