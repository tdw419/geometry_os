; DESCRIPTION: Places a green line segment connecting (209, 124) to (40, 131).
; PLAN: r0=209(x1), r1=124(y1), r2=40(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 124
LDI r2, 40
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
