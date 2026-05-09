; DESCRIPTION: Places a blue line segment connecting (305, 188) to (480, 187).
; PLAN: r0=305(x1), r1=188(y1), r2=480(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 188
LDI r2, 480
LDI r3, 187
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
