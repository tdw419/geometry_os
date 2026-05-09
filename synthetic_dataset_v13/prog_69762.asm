; DESCRIPTION: Renders a green line between points (91, 137) and (249, 221).
; PLAN: r0=91(x1), r1=137(y1), r2=249(x2), r3=221(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 137
LDI r2, 249
LDI r3, 221
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
