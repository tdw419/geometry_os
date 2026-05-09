; DESCRIPTION: Places a blue line segment connecting (32, 46) to (360, 236).
; PLAN: r0=32(x1), r1=46(y1), r2=360(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 46
LDI r2, 360
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
