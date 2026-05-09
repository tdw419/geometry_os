; DESCRIPTION: Draws a black line from (317, 80) to (249, 99).
; PLAN: r0=317(x1), r1=80(y1), r2=249(x2), r3=99(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 80
LDI r2, 249
LDI r3, 99
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
