; DESCRIPTION: Renders a yellow line between points (265, 250) and (3, 187).
; PLAN: r0=265(x1), r1=250(y1), r2=3(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 250
LDI r2, 3
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
