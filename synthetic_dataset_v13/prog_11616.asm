; DESCRIPTION: Renders a green line between points (359, 17) and (269, 57).
; PLAN: r0=359(x1), r1=17(y1), r2=269(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 17
LDI r2, 269
LDI r3, 57
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
