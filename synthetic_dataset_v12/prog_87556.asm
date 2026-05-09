; DESCRIPTION: Draws a red line from (63, 47) to (145, 47).
; PLAN: r0=63(x1), r1=47(y1), r2=145(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 47
LDI r2, 145
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
