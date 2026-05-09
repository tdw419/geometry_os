; DESCRIPTION: Renders a cyan line between points (155, 224) and (184, 127).
; PLAN: r0=155(x1), r1=224(y1), r2=184(x2), r3=127(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 224
LDI r2, 184
LDI r3, 127
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
