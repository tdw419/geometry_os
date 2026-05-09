; DESCRIPTION: Renders a yellow line between points (16, 7) and (159, 37).
; PLAN: r0=16(x1), r1=7(y1), r2=159(x2), r3=37(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 7
LDI r2, 159
LDI r3, 37
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
