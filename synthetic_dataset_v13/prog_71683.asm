; DESCRIPTION: Places a green line segment connecting (378, 178) to (488, 22).
; PLAN: r0=378(x1), r1=178(y1), r2=488(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 178
LDI r2, 488
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
