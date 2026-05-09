; DESCRIPTION: Places a green line segment connecting (441, 225) to (12, 37).
; PLAN: r0=441(x1), r1=225(y1), r2=12(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 225
LDI r2, 12
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
