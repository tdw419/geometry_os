; DESCRIPTION: Places a red line segment connecting (231, 32) to (43, 221).
; PLAN: r0=231(x1), r1=32(y1), r2=43(x2), r3=221(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 32
LDI r2, 43
LDI r3, 221
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
