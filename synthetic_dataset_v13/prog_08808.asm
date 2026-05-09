; DESCRIPTION: Renders a magenta line between points (312, 24) and (48, 225).
; PLAN: r0=312(x1), r1=24(y1), r2=48(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 24
LDI r2, 48
LDI r3, 225
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
