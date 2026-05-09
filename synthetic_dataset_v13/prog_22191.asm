; DESCRIPTION: Renders a purple line between points (110, 16) and (281, 170).
; PLAN: r0=110(x1), r1=16(y1), r2=281(x2), r3=170(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 16
LDI r2, 281
LDI r3, 170
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
