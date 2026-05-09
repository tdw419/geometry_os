; DESCRIPTION: Renders a black line between points (273, 198) and (372, 202).
; PLAN: r0=273(x1), r1=198(y1), r2=372(x2), r3=202(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 198
LDI r2, 372
LDI r3, 202
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
