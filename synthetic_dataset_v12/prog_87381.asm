; DESCRIPTION: Renders a magenta line between points (11, 71) and (278, 132).
; PLAN: r0=11(x1), r1=71(y1), r2=278(x2), r3=132(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 71
LDI r2, 278
LDI r3, 132
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
