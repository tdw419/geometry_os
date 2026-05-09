; DESCRIPTION: Renders a black line between points (278, 51) and (263, 186).
; PLAN: r0=278(x1), r1=51(y1), r2=263(x2), r3=186(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 51
LDI r2, 263
LDI r3, 186
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
