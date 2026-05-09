; DESCRIPTION: Renders a cyan line between points (253, 78) and (363, 133).
; PLAN: r0=253(x1), r1=78(y1), r2=363(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 78
LDI r2, 363
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
