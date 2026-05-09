; DESCRIPTION: Renders a yellow line between points (209, 9) and (312, 220).
; PLAN: r0=209(x1), r1=9(y1), r2=312(x2), r3=220(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 9
LDI r2, 312
LDI r3, 220
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
