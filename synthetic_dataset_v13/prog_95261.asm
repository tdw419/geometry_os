; DESCRIPTION: Draws a blue line from (367, 190) to (444, 143).
; PLAN: r0=367(x1), r1=190(y1), r2=444(x2), r3=143(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 190
LDI r2, 444
LDI r3, 143
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
