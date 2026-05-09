; DESCRIPTION: Places a green line segment connecting (138, 193) to (418, 115).
; PLAN: r0=138(x1), r1=193(y1), r2=418(x2), r3=115(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 193
LDI r2, 418
LDI r3, 115
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
