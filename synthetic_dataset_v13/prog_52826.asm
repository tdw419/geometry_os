; DESCRIPTION: Renders a magenta line between points (410, 192) and (34, 92).
; PLAN: r0=410(x1), r1=192(y1), r2=34(x2), r3=92(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 192
LDI r2, 34
LDI r3, 92
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
