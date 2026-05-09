; DESCRIPTION: Renders a magenta line between points (355, 13) and (12, 160).
; PLAN: r0=355(x1), r1=13(y1), r2=12(x2), r3=160(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 13
LDI r2, 12
LDI r3, 160
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
