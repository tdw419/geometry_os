; DESCRIPTION: Draws a yellow line from (422, 68) to (424, 140).
; PLAN: r0=422(x1), r1=68(y1), r2=424(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 68
LDI r2, 424
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
