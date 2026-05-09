; DESCRIPTION: Draws a magenta line from (508, 110) to (269, 207).
; PLAN: r0=508(x1), r1=110(y1), r2=269(x2), r3=207(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 110
LDI r2, 269
LDI r3, 207
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
