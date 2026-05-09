; DESCRIPTION: Renders a white line between points (51, 249) and (447, 193).
; PLAN: r0=51(x1), r1=249(y1), r2=447(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 249
LDI r2, 447
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
