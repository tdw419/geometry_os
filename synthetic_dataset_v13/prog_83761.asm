; DESCRIPTION: Renders a yellow line between points (188, 48) and (231, 1).
; PLAN: r0=188(x1), r1=48(y1), r2=231(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 48
LDI r2, 231
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
