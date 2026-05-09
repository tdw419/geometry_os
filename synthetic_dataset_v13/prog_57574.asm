; DESCRIPTION: Renders a green line between points (439, 85) and (223, 207).
; PLAN: r0=439(x1), r1=85(y1), r2=223(x2), r3=207(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 85
LDI r2, 223
LDI r3, 207
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
