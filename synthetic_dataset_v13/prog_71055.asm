; DESCRIPTION: Draws a yellow line from (420, 104) to (441, 124).
; PLAN: r0=420(x1), r1=104(y1), r2=441(x2), r3=124(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 104
LDI r2, 441
LDI r3, 124
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
