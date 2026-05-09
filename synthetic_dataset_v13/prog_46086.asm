; DESCRIPTION: Renders a green line between points (52, 71) and (290, 2).
; PLAN: r0=52(x1), r1=71(y1), r2=290(x2), r3=2(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 71
LDI r2, 290
LDI r3, 2
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
