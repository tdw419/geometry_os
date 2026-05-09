; DESCRIPTION: Renders a blue box of size 11x83 starting at (206, 158).
; PLAN: r0=206(x), r1=158(y), r2=11(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 158
LDI r2, 11
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
