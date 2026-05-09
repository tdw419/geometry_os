; DESCRIPTION: Renders a magenta line between points (355, 220) and (368, 13).
; PLAN: r0=355(x1), r1=220(y1), r2=368(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 220
LDI r2, 368
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
