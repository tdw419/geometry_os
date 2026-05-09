; DESCRIPTION: Draws a purple line from (498, 131) to (24, 208).
; PLAN: r0=498(x1), r1=131(y1), r2=24(x2), r3=208(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 131
LDI r2, 24
LDI r3, 208
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
