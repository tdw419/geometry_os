; DESCRIPTION: Renders a yellow line between points (70, 190) and (323, 63).
; PLAN: r0=70(x1), r1=190(y1), r2=323(x2), r3=63(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 190
LDI r2, 323
LDI r3, 63
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
