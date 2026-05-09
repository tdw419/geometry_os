; DESCRIPTION: Renders a green line between points (303, 100) and (176, 225).
; PLAN: r0=303(x1), r1=100(y1), r2=176(x2), r3=225(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 100
LDI r2, 176
LDI r3, 225
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
