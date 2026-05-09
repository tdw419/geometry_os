; DESCRIPTION: Renders a cyan line between points (106, 89) and (321, 252).
; PLAN: r0=106(x1), r1=89(y1), r2=321(x2), r3=252(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 89
LDI r2, 321
LDI r3, 252
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
