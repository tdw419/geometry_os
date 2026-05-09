; DESCRIPTION: Places a blue line segment connecting (107, 107) to (393, 144).
; PLAN: r0=107(x1), r1=107(y1), r2=393(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 107
LDI r2, 393
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
