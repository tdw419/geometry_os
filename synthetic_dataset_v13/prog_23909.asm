; DESCRIPTION: Renders a yellow line between points (29, 61) and (480, 248).
; PLAN: r0=29(x1), r1=61(y1), r2=480(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 61
LDI r2, 480
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
