; DESCRIPTION: Places a yellow line segment connecting (257, 152) to (106, 214).
; PLAN: r0=257(x1), r1=152(y1), r2=106(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 152
LDI r2, 106
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
