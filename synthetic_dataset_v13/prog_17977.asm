; DESCRIPTION: Places a black line segment connecting (156, 21) to (255, 124).
; PLAN: r0=156(x1), r1=21(y1), r2=255(x2), r3=124(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 21
LDI r2, 255
LDI r3, 124
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
