; DESCRIPTION: Places a cyan line segment connecting (369, 227) to (433, 136).
; PLAN: r0=369(x1), r1=227(y1), r2=433(x2), r3=136(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 227
LDI r2, 433
LDI r3, 136
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
