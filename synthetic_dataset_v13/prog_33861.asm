; DESCRIPTION: Places a blue line segment connecting (263, 6) to (157, 5).
; PLAN: r0=263(x1), r1=6(y1), r2=157(x2), r3=5(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 6
LDI r2, 157
LDI r3, 5
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
