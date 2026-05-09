; DESCRIPTION: Draws a yellow line from (80, 236) to (378, 196).
; PLAN: r0=80(x1), r1=236(y1), r2=378(x2), r3=196(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 236
LDI r2, 378
LDI r3, 196
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
