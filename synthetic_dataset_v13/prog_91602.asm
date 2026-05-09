; DESCRIPTION: Renders a cyan line between points (439, 91) and (419, 230).
; PLAN: r0=439(x1), r1=91(y1), r2=419(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 91
LDI r2, 419
LDI r3, 230
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
