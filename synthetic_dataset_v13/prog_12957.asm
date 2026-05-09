; DESCRIPTION: Renders a green box of size 115x63 starting at (172, 75).
; PLAN: r0=172(x), r1=75(y), r2=115(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 75
LDI r2, 115
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
