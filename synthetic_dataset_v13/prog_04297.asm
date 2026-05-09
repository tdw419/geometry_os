; DESCRIPTION: Places a blue line segment connecting (13, 223) to (171, 142).
; PLAN: r0=13(x1), r1=223(y1), r2=171(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 223
LDI r2, 171
LDI r3, 142
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
