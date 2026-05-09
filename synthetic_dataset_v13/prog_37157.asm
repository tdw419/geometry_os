; DESCRIPTION: Renders a orange line between points (197, 235) and (190, 118).
; PLAN: r0=197(x1), r1=235(y1), r2=190(x2), r3=118(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 235
LDI r2, 190
LDI r3, 118
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
