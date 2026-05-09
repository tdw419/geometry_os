; DESCRIPTION: Renders a magenta line between points (178, 229) and (247, 17).
; PLAN: r0=178(x1), r1=229(y1), r2=247(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 229
LDI r2, 247
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
