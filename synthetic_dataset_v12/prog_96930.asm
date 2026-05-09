; DESCRIPTION: Renders a cyan line between points (143, 227) and (251, 143).
; PLAN: r0=143(x1), r1=227(y1), r2=251(x2), r3=143(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 227
LDI r2, 251
LDI r3, 143
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
