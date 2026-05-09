; DESCRIPTION: Renders a yellow line between points (64, 254) and (20, 115).
; PLAN: r0=64(x1), r1=254(y1), r2=20(x2), r3=115(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 254
LDI r2, 20
LDI r3, 115
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
