; DESCRIPTION: Places a magenta line segment connecting (438, 236) to (384, 170).
; PLAN: r0=438(x1), r1=236(y1), r2=384(x2), r3=170(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 236
LDI r2, 384
LDI r3, 170
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
