; DESCRIPTION: Places a green line segment connecting (174, 28) to (233, 188).
; PLAN: r0=174(x1), r1=28(y1), r2=233(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 28
LDI r2, 233
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
