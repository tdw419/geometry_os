; DESCRIPTION: Renders a black line between points (12, 110) and (394, 120).
; PLAN: r0=12(x1), r1=110(y1), r2=394(x2), r3=120(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 110
LDI r2, 394
LDI r3, 120
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
