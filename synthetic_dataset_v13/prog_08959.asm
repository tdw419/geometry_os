; DESCRIPTION: Draws a green line from (217, 77) to (51, 12).
; PLAN: r0=217(x1), r1=77(y1), r2=51(x2), r3=12(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 77
LDI r2, 51
LDI r3, 12
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
