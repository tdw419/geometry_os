; DESCRIPTION: Places a yellow line segment connecting (216, 200) to (346, 164).
; PLAN: r0=216(x1), r1=200(y1), r2=346(x2), r3=164(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 200
LDI r2, 346
LDI r3, 164
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
