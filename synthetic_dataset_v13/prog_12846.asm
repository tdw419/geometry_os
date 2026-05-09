; DESCRIPTION: Renders a green line between points (457, 34) and (425, 222).
; PLAN: r0=457(x1), r1=34(y1), r2=425(x2), r3=222(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 34
LDI r2, 425
LDI r3, 222
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
