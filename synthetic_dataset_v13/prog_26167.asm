; DESCRIPTION: Renders a green line between points (256, 118) and (353, 241).
; PLAN: r0=256(x1), r1=118(y1), r2=353(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 118
LDI r2, 353
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
