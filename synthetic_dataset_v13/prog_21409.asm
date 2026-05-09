; DESCRIPTION: Renders a blue line between points (98, 244) and (207, 58).
; PLAN: r0=98(x1), r1=244(y1), r2=207(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 244
LDI r2, 207
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
