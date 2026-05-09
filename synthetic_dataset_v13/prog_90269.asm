; DESCRIPTION: Places a blue line segment connecting (271, 37) to (59, 226).
; PLAN: r0=271(x1), r1=37(y1), r2=59(x2), r3=226(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 37
LDI r2, 59
LDI r3, 226
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
