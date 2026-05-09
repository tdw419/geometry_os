; DESCRIPTION: Renders a yellow line between points (281, 122) and (192, 3).
; PLAN: r0=281(x1), r1=122(y1), r2=192(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 122
LDI r2, 192
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
