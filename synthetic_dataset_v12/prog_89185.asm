; DESCRIPTION: Renders a black line between points (220, 155) and (449, 255).
; PLAN: r0=220(x1), r1=155(y1), r2=449(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 155
LDI r2, 449
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
