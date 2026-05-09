; DESCRIPTION: Renders a yellow line between points (190, 127) and (26, 231).
; PLAN: r0=190(x1), r1=127(y1), r2=26(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 127
LDI r2, 26
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
