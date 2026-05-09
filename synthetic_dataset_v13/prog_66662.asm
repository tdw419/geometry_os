; DESCRIPTION: Places a black line segment connecting (262, 240) to (373, 180).
; PLAN: r0=262(x1), r1=240(y1), r2=373(x2), r3=180(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 240
LDI r2, 373
LDI r3, 180
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
