; DESCRIPTION: Places a black line segment connecting (221, 38) to (262, 48).
; PLAN: r0=221(x1), r1=38(y1), r2=262(x2), r3=48(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 38
LDI r2, 262
LDI r3, 48
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
