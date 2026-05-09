; DESCRIPTION: Places a blue line segment connecting (422, 147) to (217, 0).
; PLAN: r0=422(x1), r1=147(y1), r2=217(x2), r3=0(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 147
LDI r2, 217
LDI r3, 0
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
