; DESCRIPTION: Draws a magenta line from (481, 110) to (148, 91).
; PLAN: r0=481(x1), r1=110(y1), r2=148(x2), r3=91(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 110
LDI r2, 148
LDI r3, 91
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
