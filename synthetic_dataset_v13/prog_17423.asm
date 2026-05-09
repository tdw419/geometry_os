; DESCRIPTION: Draws a magenta line from (441, 95) to (280, 127).
; PLAN: r0=441(x1), r1=95(y1), r2=280(x2), r3=127(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 95
LDI r2, 280
LDI r3, 127
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
