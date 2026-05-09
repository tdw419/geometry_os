; DESCRIPTION: Renders a green line between points (478, 206) and (480, 94).
; PLAN: r0=478(x1), r1=206(y1), r2=480(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 206
LDI r2, 480
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
