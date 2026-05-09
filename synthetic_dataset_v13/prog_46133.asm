; DESCRIPTION: Renders a yellow line between points (12, 254) and (265, 196).
; PLAN: r0=12(x1), r1=254(y1), r2=265(x2), r3=196(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 254
LDI r2, 265
LDI r3, 196
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
