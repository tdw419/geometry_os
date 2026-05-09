; DESCRIPTION: Renders a black line between points (233, 28) and (7, 150).
; PLAN: r0=233(x1), r1=28(y1), r2=7(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 28
LDI r2, 7
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
