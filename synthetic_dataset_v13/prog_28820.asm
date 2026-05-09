; DESCRIPTION: Renders a magenta line between points (233, 177) and (336, 46).
; PLAN: r0=233(x1), r1=177(y1), r2=336(x2), r3=46(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 177
LDI r2, 336
LDI r3, 46
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
