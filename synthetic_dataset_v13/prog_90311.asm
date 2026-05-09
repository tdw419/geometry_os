; DESCRIPTION: Renders a yellow line between points (203, 82) and (425, 89).
; PLAN: r0=203(x1), r1=82(y1), r2=425(x2), r3=89(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 82
LDI r2, 425
LDI r3, 89
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
