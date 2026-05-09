; DESCRIPTION: Renders a green line between points (65, 45) and (447, 94).
; PLAN: r0=65(x1), r1=45(y1), r2=447(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 45
LDI r2, 447
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
