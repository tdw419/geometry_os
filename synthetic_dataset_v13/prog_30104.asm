; DESCRIPTION: Draws a magenta line from (453, 66) to (148, 242).
; PLAN: r0=453(x1), r1=66(y1), r2=148(x2), r3=242(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 66
LDI r2, 148
LDI r3, 242
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
