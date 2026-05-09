; DESCRIPTION: Draws a blue line from (255, 233) to (245, 104).
; PLAN: r0=255(x1), r1=233(y1), r2=245(x2), r3=104(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 233
LDI r2, 245
LDI r3, 104
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
