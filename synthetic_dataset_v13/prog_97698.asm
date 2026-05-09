; DESCRIPTION: Renders a magenta line between points (225, 36) and (57, 54).
; PLAN: r0=225(x1), r1=36(y1), r2=57(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 36
LDI r2, 57
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
