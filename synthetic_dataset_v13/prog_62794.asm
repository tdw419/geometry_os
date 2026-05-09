; DESCRIPTION: Draws a black line from (483, 36) to (208, 51).
; PLAN: r0=483(x1), r1=36(y1), r2=208(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 36
LDI r2, 208
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
