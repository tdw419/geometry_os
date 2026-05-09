; DESCRIPTION: Places a blue line segment connecting (363, 242) to (22, 253).
; PLAN: r0=363(x1), r1=242(y1), r2=22(x2), r3=253(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 242
LDI r2, 22
LDI r3, 253
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
