; DESCRIPTION: Renders a green line between points (331, 114) and (175, 145).
; PLAN: r0=331(x1), r1=114(y1), r2=175(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 114
LDI r2, 175
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
