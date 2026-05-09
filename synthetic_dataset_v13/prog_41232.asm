; DESCRIPTION: Renders a yellow line between points (230, 51) and (441, 143).
; PLAN: r0=230(x1), r1=51(y1), r2=441(x2), r3=143(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 51
LDI r2, 441
LDI r3, 143
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
