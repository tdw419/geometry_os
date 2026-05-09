; DESCRIPTION: Renders a blue line between points (202, 200) and (63, 222).
; PLAN: r0=202(x1), r1=200(y1), r2=63(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 200
LDI r2, 63
LDI r3, 222
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
