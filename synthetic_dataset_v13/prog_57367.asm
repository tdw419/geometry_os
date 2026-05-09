; DESCRIPTION: Draws a magenta line from (22, 44) to (75, 15).
; PLAN: r0=22(x1), r1=44(y1), r2=75(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 44
LDI r2, 75
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
