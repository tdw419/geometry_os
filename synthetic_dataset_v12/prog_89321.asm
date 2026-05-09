; DESCRIPTION: Places a green line segment connecting (475, 10) to (411, 161).
; PLAN: r0=475(x1), r1=10(y1), r2=411(x2), r3=161(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 10
LDI r2, 411
LDI r3, 161
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
