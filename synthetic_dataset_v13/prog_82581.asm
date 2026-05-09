; DESCRIPTION: Places a green line segment connecting (178, 48) to (303, 130).
; PLAN: r0=178(x1), r1=48(y1), r2=303(x2), r3=130(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 48
LDI r2, 303
LDI r3, 130
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
