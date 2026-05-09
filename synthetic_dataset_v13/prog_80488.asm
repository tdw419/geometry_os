; DESCRIPTION: Renders a blue line between points (266, 231) and (386, 3).
; PLAN: r0=266(x1), r1=231(y1), r2=386(x2), r3=3(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 231
LDI r2, 386
LDI r3, 3
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
