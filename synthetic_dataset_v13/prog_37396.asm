; DESCRIPTION: Draws a purple line from (399, 163) to (302, 86).
; PLAN: r0=399(x1), r1=163(y1), r2=302(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 163
LDI r2, 302
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
