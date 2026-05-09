; DESCRIPTION: Renders a magenta line between points (24, 225) and (138, 0).
; PLAN: r0=24(x1), r1=225(y1), r2=138(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 225
LDI r2, 138
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
