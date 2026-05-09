; DESCRIPTION: Draws a purple line from (298, 8) to (187, 51).
; PLAN: r0=298(x1), r1=8(y1), r2=187(x2), r3=51(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 8
LDI r2, 187
LDI r3, 51
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
