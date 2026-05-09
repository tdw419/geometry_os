; DESCRIPTION: Renders a yellow line between points (156, 104) and (319, 32).
; PLAN: r0=156(x1), r1=104(y1), r2=319(x2), r3=32(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 104
LDI r2, 319
LDI r3, 32
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
