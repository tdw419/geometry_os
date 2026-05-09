; DESCRIPTION: Renders a yellow line between points (373, 72) and (480, 24).
; PLAN: r0=373(x1), r1=72(y1), r2=480(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 72
LDI r2, 480
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
