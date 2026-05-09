; DESCRIPTION: Renders a magenta line between points (104, 77) and (393, 225).
; PLAN: r0=104(x1), r1=77(y1), r2=393(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 77
LDI r2, 393
LDI r3, 225
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
