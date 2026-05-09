; DESCRIPTION: Draws a purple line from (92, 75) to (398, 51).
; PLAN: r0=92(x1), r1=75(y1), r2=398(x2), r3=51(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 75
LDI r2, 398
LDI r3, 51
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
