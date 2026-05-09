; DESCRIPTION: Renders a magenta line between points (285, 26) and (470, 55).
; PLAN: r0=285(x1), r1=26(y1), r2=470(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 26
LDI r2, 470
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
