; DESCRIPTION: Renders a magenta line between points (18, 248) and (486, 208).
; PLAN: r0=18(x1), r1=248(y1), r2=486(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 248
LDI r2, 486
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
