; DESCRIPTION: Renders a blue line between points (166, 16) and (407, 46).
; PLAN: r0=166(x1), r1=16(y1), r2=407(x2), r3=46(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 16
LDI r2, 407
LDI r3, 46
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
