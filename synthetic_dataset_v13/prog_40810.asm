; DESCRIPTION: Renders a green line between points (253, 194) and (94, 40).
; PLAN: r0=253(x1), r1=194(y1), r2=94(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 194
LDI r2, 94
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
