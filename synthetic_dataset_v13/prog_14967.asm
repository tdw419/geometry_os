; DESCRIPTION: Renders a red line between points (128, 201) and (329, 54).
; PLAN: r0=128(x1), r1=201(y1), r2=329(x2), r3=54(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 201
LDI r2, 329
LDI r3, 54
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
