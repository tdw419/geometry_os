; DESCRIPTION: Places a green line segment connecting (135, 249) to (438, 6).
; PLAN: r0=135(x1), r1=249(y1), r2=438(x2), r3=6(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 249
LDI r2, 438
LDI r3, 6
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
