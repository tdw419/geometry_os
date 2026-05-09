; DESCRIPTION: Draws a white line from (112, 37) to (90, 51).
; PLAN: r0=112(x1), r1=37(y1), r2=90(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 37
LDI r2, 90
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
