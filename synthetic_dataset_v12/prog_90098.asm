; DESCRIPTION: Renders a white line between points (269, 235) and (241, 190).
; PLAN: r0=269(x1), r1=235(y1), r2=241(x2), r3=190(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 235
LDI r2, 241
LDI r3, 190
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
