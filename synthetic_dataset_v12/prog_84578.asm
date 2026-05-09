; DESCRIPTION: Renders a yellow line between points (46, 151) and (330, 251).
; PLAN: r0=46(x1), r1=151(y1), r2=330(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 151
LDI r2, 330
LDI r3, 251
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
