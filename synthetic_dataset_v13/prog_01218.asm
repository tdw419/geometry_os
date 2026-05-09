; DESCRIPTION: Renders a green line between points (17, 91) and (196, 102).
; PLAN: r0=17(x1), r1=91(y1), r2=196(x2), r3=102(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 91
LDI r2, 196
LDI r3, 102
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
