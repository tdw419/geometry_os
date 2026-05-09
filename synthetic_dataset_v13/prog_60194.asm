; DESCRIPTION: Renders a black line between points (224, 94) and (398, 232).
; PLAN: r0=224(x1), r1=94(y1), r2=398(x2), r3=232(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 94
LDI r2, 398
LDI r3, 232
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
