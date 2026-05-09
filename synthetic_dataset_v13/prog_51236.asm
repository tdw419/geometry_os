; DESCRIPTION: Draws a blue line from (323, 104) to (415, 241).
; PLAN: r0=323(x1), r1=104(y1), r2=415(x2), r3=241(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 104
LDI r2, 415
LDI r3, 241
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
