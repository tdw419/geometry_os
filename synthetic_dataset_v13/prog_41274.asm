; DESCRIPTION: Draws a magenta line from (36, 21) to (342, 92).
; PLAN: r0=36(x1), r1=21(y1), r2=342(x2), r3=92(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 21
LDI r2, 342
LDI r3, 92
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
