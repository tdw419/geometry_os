; DESCRIPTION: Renders a magenta line between points (428, 0) and (441, 127).
; PLAN: r0=428(x1), r1=0(y1), r2=441(x2), r3=127(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 0
LDI r2, 441
LDI r3, 127
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
