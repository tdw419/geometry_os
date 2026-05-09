; DESCRIPTION: Draws a magenta line from (247, 223) to (131, 52).
; PLAN: r0=247(x1), r1=223(y1), r2=131(x2), r3=52(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 223
LDI r2, 131
LDI r3, 52
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
