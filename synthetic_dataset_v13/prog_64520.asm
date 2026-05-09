; DESCRIPTION: Places a yellow line segment connecting (367, 173) to (266, 64).
; PLAN: r0=367(x1), r1=173(y1), r2=266(x2), r3=64(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 173
LDI r2, 266
LDI r3, 64
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
