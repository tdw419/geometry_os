; DESCRIPTION: Draws a magenta line from (1, 53) to (111, 71).
; PLAN: r0=1(x1), r1=53(y1), r2=111(x2), r3=71(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 53
LDI r2, 111
LDI r3, 71
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
