; DESCRIPTION: Renders a black line between points (377, 28) and (480, 23).
; PLAN: r0=377(x1), r1=28(y1), r2=480(x2), r3=23(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 28
LDI r2, 480
LDI r3, 23
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
