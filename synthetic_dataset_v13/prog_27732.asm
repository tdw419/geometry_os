; DESCRIPTION: Places a green line segment connecting (276, 211) to (231, 187).
; PLAN: r0=276(x1), r1=211(y1), r2=231(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 211
LDI r2, 231
LDI r3, 187
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
