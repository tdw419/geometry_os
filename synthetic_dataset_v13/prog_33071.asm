; DESCRIPTION: Draws a blue line from (391, 254) to (36, 253).
; PLAN: r0=391(x1), r1=254(y1), r2=36(x2), r3=253(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 254
LDI r2, 36
LDI r3, 253
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
