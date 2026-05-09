; DESCRIPTION: Places a yellow line segment connecting (269, 214) to (221, 44).
; PLAN: r0=269(x1), r1=214(y1), r2=221(x2), r3=44(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 214
LDI r2, 221
LDI r3, 44
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
