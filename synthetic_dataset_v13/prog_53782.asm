; DESCRIPTION: Places a red line segment connecting (231, 107) to (256, 25).
; PLAN: r0=231(x1), r1=107(y1), r2=256(x2), r3=25(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 107
LDI r2, 256
LDI r3, 25
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
