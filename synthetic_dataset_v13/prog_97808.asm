; DESCRIPTION: Places a red line segment connecting (70, 160) to (272, 207).
; PLAN: r0=70(x1), r1=160(y1), r2=272(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 160
LDI r2, 272
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
