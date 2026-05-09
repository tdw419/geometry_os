; DESCRIPTION: Renders a magenta line between points (369, 48) and (138, 91).
; PLAN: r0=369(x1), r1=48(y1), r2=138(x2), r3=91(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 48
LDI r2, 138
LDI r3, 91
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
