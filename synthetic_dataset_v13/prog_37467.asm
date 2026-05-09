; DESCRIPTION: Places a yellow line segment connecting (92, 83) to (466, 16).
; PLAN: r0=92(x1), r1=83(y1), r2=466(x2), r3=16(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 83
LDI r2, 466
LDI r3, 16
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
