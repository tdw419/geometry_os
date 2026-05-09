; DESCRIPTION: Draws a yellow line from (235, 225) to (478, 17).
; PLAN: r0=235(x1), r1=225(y1), r2=478(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 225
LDI r2, 478
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
