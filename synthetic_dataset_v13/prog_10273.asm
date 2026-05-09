; DESCRIPTION: Places a green line segment connecting (233, 219) to (404, 74).
; PLAN: r0=233(x1), r1=219(y1), r2=404(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 219
LDI r2, 404
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
