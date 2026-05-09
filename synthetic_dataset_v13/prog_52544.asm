; DESCRIPTION: Places a cyan line segment connecting (369, 94) to (142, 108).
; PLAN: r0=369(x1), r1=94(y1), r2=142(x2), r3=108(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 94
LDI r2, 142
LDI r3, 108
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
