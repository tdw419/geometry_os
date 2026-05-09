; DESCRIPTION: Places a blue line segment connecting (350, 204) to (152, 38).
; PLAN: r0=350(x1), r1=204(y1), r2=152(x2), r3=38(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 204
LDI r2, 152
LDI r3, 38
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
