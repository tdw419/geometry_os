; DESCRIPTION: Renders a blue line between points (470, 44) and (150, 138).
; PLAN: r0=470(x1), r1=44(y1), r2=150(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 44
LDI r2, 150
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
