; DESCRIPTION: Renders a yellow line between points (366, 225) and (301, 149).
; PLAN: r0=366(x1), r1=225(y1), r2=301(x2), r3=149(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 225
LDI r2, 301
LDI r3, 149
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
