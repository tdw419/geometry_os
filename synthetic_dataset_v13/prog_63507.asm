; DESCRIPTION: Draws a green line from (315, 95) to (365, 201).
; PLAN: r0=315(x1), r1=95(y1), r2=365(x2), r3=201(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 95
LDI r2, 365
LDI r3, 201
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
