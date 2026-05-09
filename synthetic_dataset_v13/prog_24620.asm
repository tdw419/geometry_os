; DESCRIPTION: Renders a green box of size 60x79 starting at (270, 72).
; PLAN: r0=270(x), r1=72(y), r2=60(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 72
LDI r2, 60
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
