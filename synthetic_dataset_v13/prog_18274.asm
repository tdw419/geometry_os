; DESCRIPTION: Draws a black line from (42, 77) to (13, 201).
; PLAN: r0=42(x1), r1=77(y1), r2=13(x2), r3=201(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 77
LDI r2, 13
LDI r3, 201
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
