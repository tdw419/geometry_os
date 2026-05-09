; DESCRIPTION: Renders a green line between points (190, 104) and (57, 87).
; PLAN: r0=190(x1), r1=104(y1), r2=57(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 104
LDI r2, 57
LDI r3, 87
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
