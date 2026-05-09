; DESCRIPTION: Renders a yellow line between points (419, 53) and (59, 73).
; PLAN: r0=419(x1), r1=53(y1), r2=59(x2), r3=73(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 53
LDI r2, 59
LDI r3, 73
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
