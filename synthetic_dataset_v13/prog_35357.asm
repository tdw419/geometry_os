; DESCRIPTION: Places a yellow line segment connecting (376, 5) to (275, 48).
; PLAN: r0=376(x1), r1=5(y1), r2=275(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 5
LDI r2, 275
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
