; DESCRIPTION: Places a cyan line segment connecting (342, 119) to (103, 49).
; PLAN: r0=342(x1), r1=119(y1), r2=103(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 119
LDI r2, 103
LDI r3, 49
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
