; DESCRIPTION: Draws a yellow line from (355, 145) to (263, 77).
; PLAN: r0=355(x1), r1=145(y1), r2=263(x2), r3=77(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 145
LDI r2, 263
LDI r3, 77
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
