; DESCRIPTION: Places a white line segment connecting (457, 234) to (231, 177).
; PLAN: r0=457(x1), r1=234(y1), r2=231(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 234
LDI r2, 231
LDI r3, 177
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
