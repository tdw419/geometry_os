; DESCRIPTION: Renders a yellow line between points (393, 62) and (150, 159).
; PLAN: r0=393(x1), r1=62(y1), r2=150(x2), r3=159(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 62
LDI r2, 150
LDI r3, 159
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
