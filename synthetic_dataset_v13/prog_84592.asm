; DESCRIPTION: Renders a black line between points (394, 34) and (203, 92).
; PLAN: r0=394(x1), r1=34(y1), r2=203(x2), r3=92(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 34
LDI r2, 203
LDI r3, 92
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
