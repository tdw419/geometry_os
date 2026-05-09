; DESCRIPTION: Renders a magenta line between points (458, 3) and (342, 221).
; PLAN: r0=458(x1), r1=3(y1), r2=342(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 3
LDI r2, 342
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
