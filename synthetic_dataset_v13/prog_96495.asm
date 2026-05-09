; DESCRIPTION: Draws a black line from (439, 52) to (413, 130).
; PLAN: r0=439(x1), r1=52(y1), r2=413(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 52
LDI r2, 413
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
