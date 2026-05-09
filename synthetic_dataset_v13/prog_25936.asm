; DESCRIPTION: Places a blue line segment connecting (70, 4) to (386, 243).
; PLAN: r0=70(x1), r1=4(y1), r2=386(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 4
LDI r2, 386
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
