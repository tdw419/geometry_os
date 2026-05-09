; DESCRIPTION: Places a yellow line segment connecting (269, 206) to (56, 152).
; PLAN: r0=269(x1), r1=206(y1), r2=56(x2), r3=152(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 206
LDI r2, 56
LDI r3, 152
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
