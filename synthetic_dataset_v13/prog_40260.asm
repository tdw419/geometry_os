; DESCRIPTION: Draws a purple line from (51, 7) to (398, 196).
; PLAN: r0=51(x1), r1=7(y1), r2=398(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 7
LDI r2, 398
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
