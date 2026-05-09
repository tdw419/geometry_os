; DESCRIPTION: Draws a green line from (9, 147) to (33, 253).
; PLAN: r0=9(x1), r1=147(y1), r2=33(x2), r3=253(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 147
LDI r2, 33
LDI r3, 253
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
