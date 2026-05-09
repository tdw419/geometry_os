; DESCRIPTION: Draws a blue line from (424, 185) to (394, 204).
; PLAN: r0=424(x1), r1=185(y1), r2=394(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 185
LDI r2, 394
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
