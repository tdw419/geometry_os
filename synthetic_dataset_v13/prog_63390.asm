; DESCRIPTION: Renders a cyan line between points (223, 158) and (253, 44).
; PLAN: r0=223(x1), r1=158(y1), r2=253(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 158
LDI r2, 253
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
