; DESCRIPTION: Places a red line segment connecting (160, 211) to (165, 3).
; PLAN: r0=160(x1), r1=211(y1), r2=165(x2), r3=3(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 211
LDI r2, 165
LDI r3, 3
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
