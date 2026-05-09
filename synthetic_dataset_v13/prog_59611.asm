; DESCRIPTION: Draws a magenta line from (441, 209) to (35, 216).
; PLAN: r0=441(x1), r1=209(y1), r2=35(x2), r3=216(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 209
LDI r2, 35
LDI r3, 216
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
