; DESCRIPTION: Renders a magenta line between points (44, 118) and (255, 208).
; PLAN: r0=44(x1), r1=118(y1), r2=255(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 118
LDI r2, 255
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
