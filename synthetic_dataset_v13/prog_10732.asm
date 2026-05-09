; DESCRIPTION: Draws a blue line from (111, 1) to (367, 204).
; PLAN: r0=111(x1), r1=1(y1), r2=367(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 1
LDI r2, 367
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
