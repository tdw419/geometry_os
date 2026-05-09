; DESCRIPTION: Places a blue line segment connecting (284, 20) to (10, 244).
; PLAN: r0=284(x1), r1=20(y1), r2=10(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 20
LDI r2, 10
LDI r3, 244
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
