; DESCRIPTION: Renders a blue box of size 76x85 starting at (407, 154).
; PLAN: r0=407(x), r1=154(y), r2=76(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 154
LDI r2, 76
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
