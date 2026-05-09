; DESCRIPTION: Places a green line segment connecting (380, 252) to (271, 23).
; PLAN: r0=380(x1), r1=252(y1), r2=271(x2), r3=23(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 252
LDI r2, 271
LDI r3, 23
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
