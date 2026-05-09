; DESCRIPTION: Draws a magenta line from (391, 53) to (393, 1).
; PLAN: r0=391(x1), r1=53(y1), r2=393(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 53
LDI r2, 393
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
