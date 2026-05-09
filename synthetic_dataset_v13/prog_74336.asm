; DESCRIPTION: Places a blue line segment connecting (20, 90) to (301, 195).
; PLAN: r0=20(x1), r1=90(y1), r2=301(x2), r3=195(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 90
LDI r2, 301
LDI r3, 195
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
