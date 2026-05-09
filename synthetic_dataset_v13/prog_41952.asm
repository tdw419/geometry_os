; DESCRIPTION: Places a red line segment connecting (207, 162) to (196, 86).
; PLAN: r0=207(x1), r1=162(y1), r2=196(x2), r3=86(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 162
LDI r2, 196
LDI r3, 86
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
