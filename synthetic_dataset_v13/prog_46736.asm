; DESCRIPTION: Places a blue line segment connecting (406, 95) to (180, 43).
; PLAN: r0=406(x1), r1=95(y1), r2=180(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 95
LDI r2, 180
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
