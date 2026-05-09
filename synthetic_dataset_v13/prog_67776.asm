; DESCRIPTION: Places a green line segment connecting (342, 17) to (48, 93).
; PLAN: r0=342(x1), r1=17(y1), r2=48(x2), r3=93(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 17
LDI r2, 48
LDI r3, 93
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
