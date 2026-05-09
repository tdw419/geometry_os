; DESCRIPTION: Places a red line segment connecting (281, 34) to (418, 64).
; PLAN: r0=281(x1), r1=34(y1), r2=418(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 34
LDI r2, 418
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
