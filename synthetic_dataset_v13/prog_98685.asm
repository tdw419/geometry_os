; DESCRIPTION: Draws a purple line from (143, 129) to (372, 249).
; PLAN: r0=143(x1), r1=129(y1), r2=372(x2), r3=249(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 129
LDI r2, 372
LDI r3, 249
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
