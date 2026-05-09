; DESCRIPTION: Places a yellow line segment connecting (261, 230) to (186, 20).
; PLAN: r0=261(x1), r1=230(y1), r2=186(x2), r3=20(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 230
LDI r2, 186
LDI r3, 20
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
