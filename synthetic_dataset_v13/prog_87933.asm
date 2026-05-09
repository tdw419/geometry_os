; DESCRIPTION: Renders a yellow line between points (303, 212) and (293, 26).
; PLAN: r0=303(x1), r1=212(y1), r2=293(x2), r3=26(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 212
LDI r2, 293
LDI r3, 26
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
