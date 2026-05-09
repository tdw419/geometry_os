; DESCRIPTION: Places a yellow line segment connecting (233, 245) to (30, 226).
; PLAN: r0=233(x1), r1=245(y1), r2=30(x2), r3=226(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 245
LDI r2, 30
LDI r3, 226
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
