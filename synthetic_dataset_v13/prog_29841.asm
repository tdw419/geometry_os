; DESCRIPTION: Draws a black line from (96, 229) to (250, 47).
; PLAN: r0=96(x1), r1=229(y1), r2=250(x2), r3=47(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 229
LDI r2, 250
LDI r3, 47
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
