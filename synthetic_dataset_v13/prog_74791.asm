; DESCRIPTION: Places a green line segment connecting (314, 107) to (380, 44).
; PLAN: r0=314(x1), r1=107(y1), r2=380(x2), r3=44(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 107
LDI r2, 380
LDI r3, 44
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
