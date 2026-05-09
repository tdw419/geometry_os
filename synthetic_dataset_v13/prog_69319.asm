; DESCRIPTION: Draws a blue line from (466, 225) to (286, 204).
; PLAN: r0=466(x1), r1=225(y1), r2=286(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 225
LDI r2, 286
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
