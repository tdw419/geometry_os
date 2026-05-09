; DESCRIPTION: Places a blue line segment connecting (245, 88) to (504, 210).
; PLAN: r0=245(x1), r1=88(y1), r2=504(x2), r3=210(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 88
LDI r2, 504
LDI r3, 210
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
