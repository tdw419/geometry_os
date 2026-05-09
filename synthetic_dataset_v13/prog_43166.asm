; DESCRIPTION: Renders a green line between points (447, 116) and (124, 232).
; PLAN: r0=447(x1), r1=116(y1), r2=124(x2), r3=232(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 116
LDI r2, 124
LDI r3, 232
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
