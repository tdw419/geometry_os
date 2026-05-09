; DESCRIPTION: Places a yellow line segment connecting (504, 165) to (317, 178).
; PLAN: r0=504(x1), r1=165(y1), r2=317(x2), r3=178(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 165
LDI r2, 317
LDI r3, 178
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
