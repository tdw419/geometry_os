; DESCRIPTION: Renders a magenta line between points (465, 73) and (223, 181).
; PLAN: r0=465(x1), r1=73(y1), r2=223(x2), r3=181(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 73
LDI r2, 223
LDI r3, 181
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
