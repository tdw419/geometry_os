; DESCRIPTION: Places a yellow line segment connecting (368, 204) to (92, 231).
; PLAN: r0=368(x1), r1=204(y1), r2=92(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 204
LDI r2, 92
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
