; DESCRIPTION: Draws a red line from (187, 92) to (448, 152).
; PLAN: r0=187(x1), r1=92(y1), r2=448(x2), r3=152(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 92
LDI r2, 448
LDI r3, 152
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
