; DESCRIPTION: Draws a blue line from (498, 144) to (508, 71).
; PLAN: r0=498(x1), r1=144(y1), r2=508(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 144
LDI r2, 508
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
