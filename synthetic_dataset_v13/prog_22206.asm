; DESCRIPTION: Renders a magenta line between points (221, 98) and (345, 51).
; PLAN: r0=221(x1), r1=98(y1), r2=345(x2), r3=51(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 98
LDI r2, 345
LDI r3, 51
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
