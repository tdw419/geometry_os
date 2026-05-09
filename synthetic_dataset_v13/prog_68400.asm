; DESCRIPTION: Places a red line segment connecting (419, 242) to (54, 231).
; PLAN: r0=419(x1), r1=242(y1), r2=54(x2), r3=231(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 242
LDI r2, 54
LDI r3, 231
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
