; DESCRIPTION: Renders a magenta line between points (388, 226) and (334, 28).
; PLAN: r0=388(x1), r1=226(y1), r2=334(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 226
LDI r2, 334
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
