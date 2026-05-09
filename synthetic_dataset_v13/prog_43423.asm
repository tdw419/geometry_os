; DESCRIPTION: Renders a black line between points (276, 229) and (501, 196).
; PLAN: r0=276(x1), r1=229(y1), r2=501(x2), r3=196(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 229
LDI r2, 501
LDI r3, 196
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
