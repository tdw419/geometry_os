; DESCRIPTION: Renders a cyan line between points (27, 147) and (26, 227).
; PLAN: r0=27(x1), r1=147(y1), r2=26(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 147
LDI r2, 26
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
