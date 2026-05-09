; DESCRIPTION: Draws a purple line from (82, 57) to (221, 11).
; PLAN: r0=82(x1), r1=57(y1), r2=221(x2), r3=11(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 57
LDI r2, 221
LDI r3, 11
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
