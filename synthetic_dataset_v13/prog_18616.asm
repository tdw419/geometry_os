; DESCRIPTION: Places a cyan line segment connecting (489, 175) to (400, 250).
; PLAN: r0=489(x1), r1=175(y1), r2=400(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 175
LDI r2, 400
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
