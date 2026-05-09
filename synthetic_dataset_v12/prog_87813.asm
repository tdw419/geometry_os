; DESCRIPTION: Places a blue line segment connecting (506, 133) to (92, 91).
; PLAN: r0=506(x1), r1=133(y1), r2=92(x2), r3=91(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 133
LDI r2, 92
LDI r3, 91
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
