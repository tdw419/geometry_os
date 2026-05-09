; DESCRIPTION: Places a cyan line segment connecting (369, 194) to (225, 220).
; PLAN: r0=369(x1), r1=194(y1), r2=225(x2), r3=220(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 194
LDI r2, 225
LDI r3, 220
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
