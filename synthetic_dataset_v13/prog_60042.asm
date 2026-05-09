; DESCRIPTION: Draws a red line from (45, 141) to (56, 80).
; PLAN: r0=45(x1), r1=141(y1), r2=56(x2), r3=80(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 141
LDI r2, 56
LDI r3, 80
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
