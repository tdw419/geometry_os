; DESCRIPTION: Renders a cyan line between points (136, 125) and (160, 185).
; PLAN: r0=136(x1), r1=125(y1), r2=160(x2), r3=185(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 125
LDI r2, 160
LDI r3, 185
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
