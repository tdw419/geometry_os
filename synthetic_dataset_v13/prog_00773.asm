; DESCRIPTION: Places a red line segment connecting (73, 240) to (32, 124).
; PLAN: r0=73(x1), r1=240(y1), r2=32(x2), r3=124(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 240
LDI r2, 32
LDI r3, 124
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
