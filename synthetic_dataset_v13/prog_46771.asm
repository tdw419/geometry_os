; DESCRIPTION: Renders a cyan line between points (269, 193) and (427, 200).
; PLAN: r0=269(x1), r1=193(y1), r2=427(x2), r3=200(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 193
LDI r2, 427
LDI r3, 200
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
