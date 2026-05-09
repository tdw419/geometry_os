; DESCRIPTION: Places a green line segment connecting (441, 175) to (65, 68).
; PLAN: r0=441(x1), r1=175(y1), r2=65(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 175
LDI r2, 65
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
