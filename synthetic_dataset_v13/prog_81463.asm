; DESCRIPTION: Renders a black line between points (329, 48) and (447, 51).
; PLAN: r0=329(x1), r1=48(y1), r2=447(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 48
LDI r2, 447
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
