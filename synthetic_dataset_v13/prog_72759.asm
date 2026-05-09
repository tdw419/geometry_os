; DESCRIPTION: Renders a yellow line between points (141, 132) and (275, 25).
; PLAN: r0=141(x1), r1=132(y1), r2=275(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 132
LDI r2, 275
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
