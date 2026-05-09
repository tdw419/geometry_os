; DESCRIPTION: Draws a green line from (56, 200) to (277, 95).
; PLAN: r0=56(x1), r1=200(y1), r2=277(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 200
LDI r2, 277
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
