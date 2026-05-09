; DESCRIPTION: Draws a orange line from (226, 190) to (305, 46).
; PLAN: r0=226(x1), r1=190(y1), r2=305(x2), r3=46(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 190
LDI r2, 305
LDI r3, 46
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
