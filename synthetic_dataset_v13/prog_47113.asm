; DESCRIPTION: Renders a green line between points (136, 63) and (254, 196).
; PLAN: r0=136(x1), r1=63(y1), r2=254(x2), r3=196(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 63
LDI r2, 254
LDI r3, 196
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
