; DESCRIPTION: Renders a yellow line between points (33, 181) and (256, 48).
; PLAN: r0=33(x1), r1=181(y1), r2=256(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 181
LDI r2, 256
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
