; DESCRIPTION: Renders a yellow line between points (21, 13) and (181, 26).
; PLAN: r0=21(x1), r1=13(y1), r2=181(x2), r3=26(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 13
LDI r2, 181
LDI r3, 26
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
