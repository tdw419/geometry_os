; DESCRIPTION: Draws a blue line from (506, 104) to (48, 186).
; PLAN: r0=506(x1), r1=104(y1), r2=48(x2), r3=186(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 104
LDI r2, 48
LDI r3, 186
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
