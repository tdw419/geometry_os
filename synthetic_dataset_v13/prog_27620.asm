; DESCRIPTION: Renders a black line between points (436, 8) and (510, 160).
; PLAN: r0=436(x1), r1=8(y1), r2=510(x2), r3=160(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 8
LDI r2, 510
LDI r3, 160
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
