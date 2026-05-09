; DESCRIPTION: Renders a yellow line between points (84, 193) and (21, 126).
; PLAN: r0=84(x1), r1=193(y1), r2=21(x2), r3=126(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 193
LDI r2, 21
LDI r3, 126
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
