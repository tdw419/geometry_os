; DESCRIPTION: Places a green line segment connecting (294, 62) to (370, 140).
; PLAN: r0=294(x1), r1=62(y1), r2=370(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 62
LDI r2, 370
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
