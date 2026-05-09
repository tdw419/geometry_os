; DESCRIPTION: Places a yellow line segment connecting (466, 186) to (92, 28).
; PLAN: r0=466(x1), r1=186(y1), r2=92(x2), r3=28(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 186
LDI r2, 92
LDI r3, 28
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
