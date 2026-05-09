; DESCRIPTION: Places a cyan line segment connecting (6, 104) to (443, 91).
; PLAN: r0=6(x1), r1=104(y1), r2=443(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 104
LDI r2, 443
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
