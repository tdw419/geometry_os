; DESCRIPTION: Renders a cyan line between points (493, 144) and (155, 211).
; PLAN: r0=493(x1), r1=144(y1), r2=155(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 144
LDI r2, 155
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
