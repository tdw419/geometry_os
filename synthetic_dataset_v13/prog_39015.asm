; DESCRIPTION: Places a black line segment connecting (262, 163) to (373, 16).
; PLAN: r0=262(x1), r1=163(y1), r2=373(x2), r3=16(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 163
LDI r2, 373
LDI r3, 16
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
