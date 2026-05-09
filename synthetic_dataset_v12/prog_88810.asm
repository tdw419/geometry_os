; DESCRIPTION: Renders a red line between points (480, 49) and (428, 94).
; PLAN: r0=480(x1), r1=49(y1), r2=428(x2), r3=94(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 49
LDI r2, 428
LDI r3, 94
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
