; DESCRIPTION: Renders a black line between points (431, 98) and (279, 94).
; PLAN: r0=431(x1), r1=98(y1), r2=279(x2), r3=94(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 98
LDI r2, 279
LDI r3, 94
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
