; DESCRIPTION: Renders a black line between points (437, 86) and (439, 52).
; PLAN: r0=437(x1), r1=86(y1), r2=439(x2), r3=52(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 86
LDI r2, 439
LDI r3, 52
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
