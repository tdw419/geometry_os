; DESCRIPTION: Renders a magenta line between points (149, 253) and (120, 138).
; PLAN: r0=149(x1), r1=253(y1), r2=120(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 253
LDI r2, 120
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
