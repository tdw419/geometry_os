; DESCRIPTION: Renders a green line between points (15, 165) and (176, 241).
; PLAN: r0=15(x1), r1=165(y1), r2=176(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 165
LDI r2, 176
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
