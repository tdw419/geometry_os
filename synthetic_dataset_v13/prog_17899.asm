; DESCRIPTION: Renders a magenta line between points (165, 65) and (342, 139).
; PLAN: r0=165(x1), r1=65(y1), r2=342(x2), r3=139(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 65
LDI r2, 342
LDI r3, 139
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
