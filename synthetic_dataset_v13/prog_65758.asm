; DESCRIPTION: Renders a black line between points (368, 229) and (175, 97).
; PLAN: r0=368(x1), r1=229(y1), r2=175(x2), r3=97(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 229
LDI r2, 175
LDI r3, 97
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
