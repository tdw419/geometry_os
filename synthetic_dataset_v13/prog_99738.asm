; DESCRIPTION: Renders a magenta line between points (189, 138) and (27, 54).
; PLAN: r0=189(x1), r1=138(y1), r2=27(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 138
LDI r2, 27
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
