; DESCRIPTION: Renders a blue line between points (396, 186) and (440, 26).
; PLAN: r0=396(x1), r1=186(y1), r2=440(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 186
LDI r2, 440
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
