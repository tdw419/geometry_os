; DESCRIPTION: Places a cyan line segment connecting (40, 104) to (75, 84).
; PLAN: r0=40(x1), r1=104(y1), r2=75(x2), r3=84(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 104
LDI r2, 75
LDI r3, 84
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
