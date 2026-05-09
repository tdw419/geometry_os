; DESCRIPTION: Renders a green box of size 63x65 starting at (359, 51).
; PLAN: r0=359(x), r1=51(y), r2=63(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 51
LDI r2, 63
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
