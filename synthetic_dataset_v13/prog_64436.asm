; DESCRIPTION: Renders a green line between points (371, 234) and (269, 84).
; PLAN: r0=371(x1), r1=234(y1), r2=269(x2), r3=84(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 234
LDI r2, 269
LDI r3, 84
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
