; DESCRIPTION: Draws a magenta line from (92, 18) to (341, 170).
; PLAN: r0=92(x1), r1=18(y1), r2=341(x2), r3=170(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 18
LDI r2, 341
LDI r3, 170
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
