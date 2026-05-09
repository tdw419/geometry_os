; DESCRIPTION: Renders a magenta line between points (373, 176) and (468, 190).
; PLAN: r0=373(x1), r1=176(y1), r2=468(x2), r3=190(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 176
LDI r2, 468
LDI r3, 190
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
