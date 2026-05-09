; DESCRIPTION: Draws a blue line from (48, 51) to (98, 204).
; PLAN: r0=48(x1), r1=51(y1), r2=98(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 51
LDI r2, 98
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
