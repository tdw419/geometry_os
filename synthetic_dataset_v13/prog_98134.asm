; DESCRIPTION: Renders a blue line between points (114, 255) and (386, 123).
; PLAN: r0=114(x1), r1=255(y1), r2=386(x2), r3=123(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 255
LDI r2, 386
LDI r3, 123
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
