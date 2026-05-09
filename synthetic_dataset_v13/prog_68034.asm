; DESCRIPTION: Renders a black line between points (460, 20) and (148, 131).
; PLAN: r0=460(x1), r1=20(y1), r2=148(x2), r3=131(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 20
LDI r2, 148
LDI r3, 131
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
