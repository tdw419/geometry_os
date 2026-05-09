; DESCRIPTION: Renders a green line between points (223, 27) and (170, 97).
; PLAN: r0=223(x1), r1=27(y1), r2=170(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 27
LDI r2, 170
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
