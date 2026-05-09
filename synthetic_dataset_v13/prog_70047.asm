; DESCRIPTION: Renders a green line between points (175, 183) and (65, 52).
; PLAN: r0=175(x1), r1=183(y1), r2=65(x2), r3=52(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 183
LDI r2, 65
LDI r3, 52
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
