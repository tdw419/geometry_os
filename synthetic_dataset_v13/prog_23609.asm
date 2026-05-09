; DESCRIPTION: Places a yellow line segment connecting (48, 165) to (266, 184).
; PLAN: r0=48(x1), r1=165(y1), r2=266(x2), r3=184(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 165
LDI r2, 266
LDI r3, 184
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
