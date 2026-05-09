; DESCRIPTION: Renders a green box of size 87x51 starting at (212, 100).
; PLAN: r0=212(x), r1=100(y), r2=87(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 100
LDI r2, 87
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
