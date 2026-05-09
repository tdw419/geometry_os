; DESCRIPTION: Places a red line segment connecting (411, 48) to (391, 70).
; PLAN: r0=411(x1), r1=48(y1), r2=391(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 48
LDI r2, 391
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
