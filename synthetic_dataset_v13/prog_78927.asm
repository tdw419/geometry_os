; DESCRIPTION: Renders a cyan line between points (6, 47) and (147, 109).
; PLAN: r0=6(x1), r1=47(y1), r2=147(x2), r3=109(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 47
LDI r2, 147
LDI r3, 109
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
