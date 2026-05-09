; DESCRIPTION: Renders a blue box of size 79x63 starting at (192, 102).
; PLAN: r0=192(x), r1=102(y), r2=79(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 102
LDI r2, 79
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
