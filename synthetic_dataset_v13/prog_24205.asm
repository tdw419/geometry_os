; DESCRIPTION: Draws a yellow line from (113, 218) to (104, 218).
; PLAN: r0=113(x1), r1=218(y1), r2=104(x2), r3=218(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 218
LDI r2, 104
LDI r3, 218
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
