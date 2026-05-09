; DESCRIPTION: Places a green line segment connecting (326, 184) to (71, 231).
; PLAN: r0=326(x1), r1=184(y1), r2=71(x2), r3=231(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 184
LDI r2, 71
LDI r3, 231
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
