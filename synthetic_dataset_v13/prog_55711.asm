; DESCRIPTION: Draws a red line from (45, 99) to (124, 84).
; PLAN: r0=45(x1), r1=99(y1), r2=124(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 99
LDI r2, 124
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
