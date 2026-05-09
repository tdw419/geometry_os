; DESCRIPTION: Renders a yellow line between points (427, 37) and (208, 187).
; PLAN: r0=427(x1), r1=37(y1), r2=208(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 37
LDI r2, 208
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
