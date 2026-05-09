; DESCRIPTION: Draws a blue line from (297, 220) to (33, 23).
; PLAN: r0=297(x1), r1=220(y1), r2=33(x2), r3=23(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 220
LDI r2, 33
LDI r3, 23
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
