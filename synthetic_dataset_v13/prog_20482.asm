; DESCRIPTION: Places a red line segment connecting (289, 207) to (8, 231).
; PLAN: r0=289(x1), r1=207(y1), r2=8(x2), r3=231(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 207
LDI r2, 8
LDI r3, 231
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
