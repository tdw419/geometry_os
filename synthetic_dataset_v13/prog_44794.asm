; DESCRIPTION: Renders a black line between points (305, 14) and (480, 75).
; PLAN: r0=305(x1), r1=14(y1), r2=480(x2), r3=75(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 14
LDI r2, 480
LDI r3, 75
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
