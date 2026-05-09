; DESCRIPTION: Renders a black line between points (470, 64) and (489, 4).
; PLAN: r0=470(x1), r1=64(y1), r2=489(x2), r3=4(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 64
LDI r2, 489
LDI r3, 4
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
