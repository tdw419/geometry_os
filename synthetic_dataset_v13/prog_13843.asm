; DESCRIPTION: Draws a blue line from (217, 204) to (39, 101).
; PLAN: r0=217(x1), r1=204(y1), r2=39(x2), r3=101(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 204
LDI r2, 39
LDI r3, 101
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
