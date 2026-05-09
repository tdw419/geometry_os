; DESCRIPTION: Renders a magenta line between points (275, 177) and (165, 194).
; PLAN: r0=275(x1), r1=177(y1), r2=165(x2), r3=194(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 177
LDI r2, 165
LDI r3, 194
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
