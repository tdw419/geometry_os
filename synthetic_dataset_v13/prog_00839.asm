; DESCRIPTION: Renders a blue line between points (4, 26) and (465, 244).
; PLAN: r0=4(x1), r1=26(y1), r2=465(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 26
LDI r2, 465
LDI r3, 244
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
