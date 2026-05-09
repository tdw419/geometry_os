; DESCRIPTION: Renders a cyan line between points (186, 17) and (133, 156).
; PLAN: r0=186(x1), r1=17(y1), r2=133(x2), r3=156(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 17
LDI r2, 133
LDI r3, 156
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
