; DESCRIPTION: Renders a yellow line between points (294, 235) and (96, 94).
; PLAN: r0=294(x1), r1=235(y1), r2=96(x2), r3=94(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 235
LDI r2, 96
LDI r3, 94
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
