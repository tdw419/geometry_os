; DESCRIPTION: Renders a yellow line between points (13, 91) and (300, 94).
; PLAN: r0=13(x1), r1=91(y1), r2=300(x2), r3=94(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 91
LDI r2, 300
LDI r3, 94
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
