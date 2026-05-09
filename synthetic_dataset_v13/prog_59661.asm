; DESCRIPTION: Renders a magenta line between points (139, 190) and (117, 234).
; PLAN: r0=139(x1), r1=190(y1), r2=117(x2), r3=234(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 190
LDI r2, 117
LDI r3, 234
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
