; DESCRIPTION: Renders a black line between points (175, 127) and (54, 98).
; PLAN: r0=175(x1), r1=127(y1), r2=54(x2), r3=98(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 127
LDI r2, 54
LDI r3, 98
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
