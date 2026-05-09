; DESCRIPTION: Places a cyan line segment connecting (189, 134) to (475, 54).
; PLAN: r0=189(x1), r1=134(y1), r2=475(x2), r3=54(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 134
LDI r2, 475
LDI r3, 54
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
