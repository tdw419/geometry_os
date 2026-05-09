; DESCRIPTION: Renders a yellow line between points (16, 74) and (278, 9).
; PLAN: r0=16(x1), r1=74(y1), r2=278(x2), r3=9(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 74
LDI r2, 278
LDI r3, 9
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
