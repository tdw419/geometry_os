; DESCRIPTION: Renders a green line between points (52, 165) and (91, 54).
; PLAN: r0=52(x1), r1=165(y1), r2=91(x2), r3=54(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 165
LDI r2, 91
LDI r3, 54
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
