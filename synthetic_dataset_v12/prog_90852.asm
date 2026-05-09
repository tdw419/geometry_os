; DESCRIPTION: Renders a yellow line between points (46, 197) and (22, 140).
; PLAN: r0=46(x1), r1=197(y1), r2=22(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 197
LDI r2, 22
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
