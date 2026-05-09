; DESCRIPTION: Renders a magenta line between points (169, 189) and (465, 164).
; PLAN: r0=169(x1), r1=189(y1), r2=465(x2), r3=164(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 189
LDI r2, 465
LDI r3, 164
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
