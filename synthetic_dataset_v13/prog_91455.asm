; DESCRIPTION: Draws a magenta line from (508, 166) to (305, 181).
; PLAN: r0=508(x1), r1=166(y1), r2=305(x2), r3=181(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 166
LDI r2, 305
LDI r3, 181
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
