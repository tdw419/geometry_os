; DESCRIPTION: Draws a blue line from (305, 66) to (399, 190).
; PLAN: r0=305(x1), r1=66(y1), r2=399(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 66
LDI r2, 399
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
