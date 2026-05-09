; DESCRIPTION: Places a blue line segment connecting (433, 250) to (59, 68).
; PLAN: r0=433(x1), r1=250(y1), r2=59(x2), r3=68(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 250
LDI r2, 59
LDI r3, 68
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
