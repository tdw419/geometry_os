; DESCRIPTION: Renders a yellow line between points (190, 186) and (354, 156).
; PLAN: r0=190(x1), r1=186(y1), r2=354(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 186
LDI r2, 354
LDI r3, 156
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
