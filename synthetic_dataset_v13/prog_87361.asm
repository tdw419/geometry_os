; DESCRIPTION: Renders a yellow line between points (192, 45) and (277, 241).
; PLAN: r0=192(x1), r1=45(y1), r2=277(x2), r3=241(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 45
LDI r2, 277
LDI r3, 241
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
