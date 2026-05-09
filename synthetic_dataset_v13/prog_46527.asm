; DESCRIPTION: Places a blue line segment connecting (341, 249) to (487, 10).
; PLAN: r0=341(x1), r1=249(y1), r2=487(x2), r3=10(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 249
LDI r2, 487
LDI r3, 10
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
