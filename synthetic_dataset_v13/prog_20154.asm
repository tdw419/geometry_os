; DESCRIPTION: Renders a black line between points (363, 201) and (410, 187).
; PLAN: r0=363(x1), r1=201(y1), r2=410(x2), r3=187(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 201
LDI r2, 410
LDI r3, 187
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
