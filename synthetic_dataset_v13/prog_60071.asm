; DESCRIPTION: Places a cyan line segment connecting (296, 119) to (87, 34).
; PLAN: r0=296(x1), r1=119(y1), r2=87(x2), r3=34(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 119
LDI r2, 87
LDI r3, 34
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
