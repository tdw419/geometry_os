; DESCRIPTION: Renders a yellow line between points (249, 235) and (456, 91).
; PLAN: r0=249(x1), r1=235(y1), r2=456(x2), r3=91(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 235
LDI r2, 456
LDI r3, 91
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
