; DESCRIPTION: Places a red line segment connecting (237, 175) to (221, 20).
; PLAN: r0=237(x1), r1=175(y1), r2=221(x2), r3=20(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 175
LDI r2, 221
LDI r3, 20
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
