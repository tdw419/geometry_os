; DESCRIPTION: Draws a magenta line from (250, 182) to (11, 48).
; PLAN: r0=250(x1), r1=182(y1), r2=11(x2), r3=48(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 182
LDI r2, 11
LDI r3, 48
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
