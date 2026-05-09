; DESCRIPTION: Places a cyan line segment connecting (296, 100) to (467, 62).
; PLAN: r0=296(x1), r1=100(y1), r2=467(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 100
LDI r2, 467
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
