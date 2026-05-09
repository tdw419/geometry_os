; DESCRIPTION: Renders a black line between points (328, 10) and (1, 92).
; PLAN: r0=328(x1), r1=10(y1), r2=1(x2), r3=92(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 10
LDI r2, 1
LDI r3, 92
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
