; DESCRIPTION: Renders a yellow line between points (94, 164) and (254, 196).
; PLAN: r0=94(x1), r1=164(y1), r2=254(x2), r3=196(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 164
LDI r2, 254
LDI r3, 196
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
