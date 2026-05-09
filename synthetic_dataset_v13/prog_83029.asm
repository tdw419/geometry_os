; DESCRIPTION: Renders a black line between points (65, 201) and (410, 63).
; PLAN: r0=65(x1), r1=201(y1), r2=410(x2), r3=63(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 201
LDI r2, 410
LDI r3, 63
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
