; DESCRIPTION: Draws a yellow line from (378, 104) to (205, 16).
; PLAN: r0=378(x1), r1=104(y1), r2=205(x2), r3=16(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 104
LDI r2, 205
LDI r3, 16
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
