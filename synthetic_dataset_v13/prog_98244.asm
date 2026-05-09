; DESCRIPTION: Renders a blue line between points (263, 110) and (46, 150).
; PLAN: r0=263(x1), r1=110(y1), r2=46(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 110
LDI r2, 46
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
