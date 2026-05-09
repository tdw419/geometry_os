; DESCRIPTION: Draws a purple line from (250, 228) to (221, 200).
; PLAN: r0=250(x1), r1=228(y1), r2=221(x2), r3=200(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 228
LDI r2, 221
LDI r3, 200
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
