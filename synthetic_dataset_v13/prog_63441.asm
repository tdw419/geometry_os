; DESCRIPTION: Draws a magenta line from (350, 73) to (149, 71).
; PLAN: r0=350(x1), r1=73(y1), r2=149(x2), r3=71(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 73
LDI r2, 149
LDI r3, 71
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
