; DESCRIPTION: Draws a blue line from (214, 24) to (221, 204).
; PLAN: r0=214(x1), r1=24(y1), r2=221(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 24
LDI r2, 221
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
