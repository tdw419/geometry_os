; DESCRIPTION: Renders a yellow line between points (190, 178) and (157, 109).
; PLAN: r0=190(x1), r1=178(y1), r2=157(x2), r3=109(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 178
LDI r2, 157
LDI r3, 109
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
