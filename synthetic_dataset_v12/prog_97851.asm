; DESCRIPTION: Renders a green line between points (17, 194) and (156, 71).
; PLAN: r0=17(x1), r1=194(y1), r2=156(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 194
LDI r2, 156
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
