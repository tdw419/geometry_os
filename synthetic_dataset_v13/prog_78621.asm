; DESCRIPTION: Places a yellow line segment connecting (254, 249) to (234, 169).
; PLAN: r0=254(x1), r1=249(y1), r2=234(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 249
LDI r2, 234
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
