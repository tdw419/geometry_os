; DESCRIPTION: Places a red line segment connecting (390, 220) to (264, 42).
; PLAN: r0=390(x1), r1=220(y1), r2=264(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 220
LDI r2, 264
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
