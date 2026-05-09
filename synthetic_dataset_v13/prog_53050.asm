; DESCRIPTION: Renders a yellow line between points (1, 87) and (23, 206).
; PLAN: r0=1(x1), r1=87(y1), r2=23(x2), r3=206(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 87
LDI r2, 23
LDI r3, 206
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
