; DESCRIPTION: Renders a cyan line between points (365, 89) and (241, 147).
; PLAN: r0=365(x1), r1=89(y1), r2=241(x2), r3=147(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 89
LDI r2, 241
LDI r3, 147
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
