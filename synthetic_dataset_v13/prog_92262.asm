; DESCRIPTION: Draws a black line from (36, 10) to (91, 92).
; PLAN: r0=36(x1), r1=10(y1), r2=91(x2), r3=92(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 10
LDI r2, 91
LDI r3, 92
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
