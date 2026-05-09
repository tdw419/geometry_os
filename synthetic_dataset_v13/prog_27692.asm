; DESCRIPTION: Draws a black line from (190, 79) to (372, 79).
; PLAN: r0=190(x1), r1=79(y1), r2=372(x2), r3=79(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 79
LDI r2, 372
LDI r3, 79
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
