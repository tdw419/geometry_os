; DESCRIPTION: Places a blue line segment connecting (487, 202) to (480, 97).
; PLAN: r0=487(x1), r1=202(y1), r2=480(x2), r3=97(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 202
LDI r2, 480
LDI r3, 97
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
