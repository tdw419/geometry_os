; DESCRIPTION: Places a blue line segment connecting (62, 146) to (218, 236).
; PLAN: r0=62(x1), r1=146(y1), r2=218(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 146
LDI r2, 218
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
