; DESCRIPTION: Draws a magenta line from (341, 30) to (403, 190).
; PLAN: r0=341(x1), r1=30(y1), r2=403(x2), r3=190(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 30
LDI r2, 403
LDI r3, 190
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
