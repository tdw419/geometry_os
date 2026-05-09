; DESCRIPTION: Renders a black line between points (79, 37) and (186, 51).
; PLAN: r0=79(x1), r1=37(y1), r2=186(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 37
LDI r2, 186
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
