; DESCRIPTION: Places a yellow line segment connecting (323, 230) to (434, 210).
; PLAN: r0=323(x1), r1=230(y1), r2=434(x2), r3=210(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 230
LDI r2, 434
LDI r3, 210
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
