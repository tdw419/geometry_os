; DESCRIPTION: Places a red line segment connecting (280, 44) to (370, 72).
; PLAN: r0=280(x1), r1=44(y1), r2=370(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 44
LDI r2, 370
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
