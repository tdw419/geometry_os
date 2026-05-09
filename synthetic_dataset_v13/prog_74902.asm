; DESCRIPTION: Places a red line segment connecting (83, 50) to (327, 176).
; PLAN: r0=83(x1), r1=50(y1), r2=327(x2), r3=176(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 50
LDI r2, 327
LDI r3, 176
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
