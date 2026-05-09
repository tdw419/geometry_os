; DESCRIPTION: Renders a black line between points (341, 69) and (480, 75).
; PLAN: r0=341(x1), r1=69(y1), r2=480(x2), r3=75(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 69
LDI r2, 480
LDI r3, 75
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
