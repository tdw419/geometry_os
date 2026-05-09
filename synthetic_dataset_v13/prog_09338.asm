; DESCRIPTION: Draws a black line from (472, 87) to (277, 196).
; PLAN: r0=472(x1), r1=87(y1), r2=277(x2), r3=196(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 87
LDI r2, 277
LDI r3, 196
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
