; DESCRIPTION: Places a black line segment connecting (460, 5) to (262, 130).
; PLAN: r0=460(x1), r1=5(y1), r2=262(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 5
LDI r2, 262
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
