; DESCRIPTION: Renders a cyan line between points (136, 237) and (463, 106).
; PLAN: r0=136(x1), r1=237(y1), r2=463(x2), r3=106(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 237
LDI r2, 463
LDI r3, 106
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
