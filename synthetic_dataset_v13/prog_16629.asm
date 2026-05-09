; DESCRIPTION: Draws a yellow line from (87, 104) to (373, 91).
; PLAN: r0=87(x1), r1=104(y1), r2=373(x2), r3=91(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 104
LDI r2, 373
LDI r3, 91
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
