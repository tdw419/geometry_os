; DESCRIPTION: Draws a purple line from (372, 174) to (180, 102).
; PLAN: r0=372(x1), r1=174(y1), r2=180(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 174
LDI r2, 180
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
