; DESCRIPTION: Places a blue line segment connecting (171, 135) to (220, 31).
; PLAN: r0=171(x1), r1=135(y1), r2=220(x2), r3=31(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 135
LDI r2, 220
LDI r3, 31
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
