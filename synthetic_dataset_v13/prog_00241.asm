; DESCRIPTION: Places a black line segment connecting (225, 243) to (453, 59).
; PLAN: r0=225(x1), r1=243(y1), r2=453(x2), r3=59(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 243
LDI r2, 453
LDI r3, 59
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
