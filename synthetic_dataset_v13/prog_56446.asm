; DESCRIPTION: Places a green line segment connecting (83, 93) to (269, 58).
; PLAN: r0=83(x1), r1=93(y1), r2=269(x2), r3=58(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 93
LDI r2, 269
LDI r3, 58
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
