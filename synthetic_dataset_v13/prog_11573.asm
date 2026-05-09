; DESCRIPTION: Draws a yellow line from (433, 190) to (377, 19).
; PLAN: r0=433(x1), r1=190(y1), r2=377(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 190
LDI r2, 377
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
