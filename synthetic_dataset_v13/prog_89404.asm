; DESCRIPTION: Places a blue line segment connecting (487, 135) to (16, 104).
; PLAN: r0=487(x1), r1=135(y1), r2=16(x2), r3=104(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 135
LDI r2, 16
LDI r3, 104
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
