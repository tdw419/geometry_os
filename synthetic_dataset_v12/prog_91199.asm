; DESCRIPTION: Places a red line segment connecting (480, 162) to (430, 208).
; PLAN: r0=480(x1), r1=162(y1), r2=430(x2), r3=208(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 162
LDI r2, 430
LDI r3, 208
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
