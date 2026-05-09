; DESCRIPTION: Renders a black line between points (271, 99) and (17, 168).
; PLAN: r0=271(x1), r1=99(y1), r2=17(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 99
LDI r2, 17
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
