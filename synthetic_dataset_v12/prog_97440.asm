; DESCRIPTION: Draws a magenta line from (33, 11) to (508, 44).
; PLAN: r0=33(x1), r1=11(y1), r2=508(x2), r3=44(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 11
LDI r2, 508
LDI r3, 44
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
