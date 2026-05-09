; DESCRIPTION: Draws a yellow line from (260, 80) to (400, 25).
; PLAN: r0=260(x1), r1=80(y1), r2=400(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 80
LDI r2, 400
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
