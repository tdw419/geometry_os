; DESCRIPTION: Renders a white line between points (4, 40) and (251, 190).
; PLAN: r0=4(x1), r1=40(y1), r2=251(x2), r3=190(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 40
LDI r2, 251
LDI r3, 190
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
