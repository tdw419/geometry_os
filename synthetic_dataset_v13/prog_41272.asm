; DESCRIPTION: Places a blue line segment connecting (275, 53) to (198, 152).
; PLAN: r0=275(x1), r1=53(y1), r2=198(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 53
LDI r2, 198
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
