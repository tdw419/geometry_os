; DESCRIPTION: Renders a yellow line between points (473, 71) and (340, 120).
; PLAN: r0=473(x1), r1=71(y1), r2=340(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 71
LDI r2, 340
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
