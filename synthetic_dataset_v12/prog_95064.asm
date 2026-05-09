; DESCRIPTION: Renders a cyan line between points (463, 193) and (408, 211).
; PLAN: r0=463(x1), r1=193(y1), r2=408(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 193
LDI r2, 408
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
