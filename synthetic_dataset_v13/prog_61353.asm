; DESCRIPTION: Renders a green line between points (333, 227) and (86, 208).
; PLAN: r0=333(x1), r1=227(y1), r2=86(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 227
LDI r2, 86
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
