; DESCRIPTION: Places a green line segment connecting (63, 225) to (185, 249).
; PLAN: r0=63(x1), r1=225(y1), r2=185(x2), r3=249(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 225
LDI r2, 185
LDI r3, 249
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
