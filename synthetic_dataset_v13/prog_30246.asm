; DESCRIPTION: Renders a magenta line between points (470, 225) and (288, 137).
; PLAN: r0=470(x1), r1=225(y1), r2=288(x2), r3=137(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 225
LDI r2, 288
LDI r3, 137
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
