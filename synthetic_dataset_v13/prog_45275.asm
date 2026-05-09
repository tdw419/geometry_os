; DESCRIPTION: Places a red line segment connecting (361, 87) to (255, 2).
; PLAN: r0=361(x1), r1=87(y1), r2=255(x2), r3=2(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 87
LDI r2, 255
LDI r3, 2
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
