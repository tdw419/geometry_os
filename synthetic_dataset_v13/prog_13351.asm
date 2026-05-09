; DESCRIPTION: Places a white line segment connecting (408, 22) to (231, 27).
; PLAN: r0=408(x1), r1=22(y1), r2=231(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 22
LDI r2, 231
LDI r3, 27
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
