; DESCRIPTION: Renders a green line between points (340, 230) and (201, 39).
; PLAN: r0=340(x1), r1=230(y1), r2=201(x2), r3=39(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 230
LDI r2, 201
LDI r3, 39
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
