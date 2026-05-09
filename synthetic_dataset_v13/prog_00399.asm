; DESCRIPTION: Places a yellow line segment connecting (297, 230) to (295, 11).
; PLAN: r0=297(x1), r1=230(y1), r2=295(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 230
LDI r2, 295
LDI r3, 11
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
