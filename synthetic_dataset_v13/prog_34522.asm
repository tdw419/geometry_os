; DESCRIPTION: Draws a magenta line from (428, 194) to (121, 150).
; PLAN: r0=428(x1), r1=194(y1), r2=121(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 194
LDI r2, 121
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
