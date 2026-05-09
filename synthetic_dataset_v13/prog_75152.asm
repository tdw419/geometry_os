; DESCRIPTION: Places a blue line segment connecting (415, 90) to (168, 152).
; PLAN: r0=415(x1), r1=90(y1), r2=168(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 90
LDI r2, 168
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
