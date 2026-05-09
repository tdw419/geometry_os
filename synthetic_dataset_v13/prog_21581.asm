; DESCRIPTION: Renders a green line between points (211, 197) and (300, 102).
; PLAN: r0=211(x1), r1=197(y1), r2=300(x2), r3=102(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 197
LDI r2, 300
LDI r3, 102
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
