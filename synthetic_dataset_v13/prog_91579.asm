; DESCRIPTION: Renders a green box of size 81x16 starting at (229, 145).
; PLAN: r0=229(x), r1=145(y), r2=81(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 145
LDI r2, 81
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
