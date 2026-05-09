; DESCRIPTION: Places a blue line segment connecting (498, 164) to (386, 80).
; PLAN: r0=498(x1), r1=164(y1), r2=386(x2), r3=80(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 164
LDI r2, 386
LDI r3, 80
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
