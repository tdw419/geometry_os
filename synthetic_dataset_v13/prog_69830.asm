; DESCRIPTION: Places a magenta line segment connecting (444, 114) to (438, 231).
; PLAN: r0=444(x1), r1=114(y1), r2=438(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 114
LDI r2, 438
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
