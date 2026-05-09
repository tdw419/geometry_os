; DESCRIPTION: Places a blue line segment connecting (353, 152) to (48, 32).
; PLAN: r0=353(x1), r1=152(y1), r2=48(x2), r3=32(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 152
LDI r2, 48
LDI r3, 32
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
