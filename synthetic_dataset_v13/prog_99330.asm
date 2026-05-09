; DESCRIPTION: Renders a blue line between points (57, 207) and (321, 207).
; PLAN: r0=57(x1), r1=207(y1), r2=321(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 207
LDI r2, 321
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
