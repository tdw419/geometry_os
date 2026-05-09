; DESCRIPTION: Places a red line segment connecting (27, 136) to (58, 221).
; PLAN: r0=27(x1), r1=136(y1), r2=58(x2), r3=221(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 136
LDI r2, 58
LDI r3, 221
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
