; DESCRIPTION: Places a cyan line segment connecting (75, 201) to (109, 211).
; PLAN: r0=75(x1), r1=201(y1), r2=109(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 201
LDI r2, 109
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
