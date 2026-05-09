; DESCRIPTION: Places a green line segment connecting (275, 190) to (94, 244).
; PLAN: r0=275(x1), r1=190(y1), r2=94(x2), r3=244(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 190
LDI r2, 94
LDI r3, 244
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
