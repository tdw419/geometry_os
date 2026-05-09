; DESCRIPTION: Places a green line segment connecting (418, 209) to (108, 131).
; PLAN: r0=418(x1), r1=209(y1), r2=108(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 209
LDI r2, 108
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
