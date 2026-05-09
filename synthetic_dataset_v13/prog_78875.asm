; DESCRIPTION: Renders a black line between points (181, 223) and (249, 144).
; PLAN: r0=181(x1), r1=223(y1), r2=249(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 223
LDI r2, 249
LDI r3, 144
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
