; DESCRIPTION: Places a white line segment connecting (472, 164) to (231, 54).
; PLAN: r0=472(x1), r1=164(y1), r2=231(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 164
LDI r2, 231
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
