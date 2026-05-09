; DESCRIPTION: Draws a magenta line from (187, 163) to (135, 211).
; PLAN: r0=187(x1), r1=163(y1), r2=135(x2), r3=211(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 163
LDI r2, 135
LDI r3, 211
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
