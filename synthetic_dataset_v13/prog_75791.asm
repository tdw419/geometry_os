; DESCRIPTION: Places a yellow line segment connecting (198, 36) to (204, 135).
; PLAN: r0=198(x1), r1=36(y1), r2=204(x2), r3=135(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 36
LDI r2, 204
LDI r3, 135
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
