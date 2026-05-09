; DESCRIPTION: Places a green line segment connecting (174, 241) to (380, 22).
; PLAN: r0=174(x1), r1=241(y1), r2=380(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 241
LDI r2, 380
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
