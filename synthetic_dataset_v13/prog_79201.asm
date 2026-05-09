; DESCRIPTION: Renders a white line between points (151, 144) and (447, 48).
; PLAN: r0=151(x1), r1=144(y1), r2=447(x2), r3=48(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 144
LDI r2, 447
LDI r3, 48
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
