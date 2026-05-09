; DESCRIPTION: Places a green line segment connecting (194, 115) to (174, 12).
; PLAN: r0=194(x1), r1=115(y1), r2=174(x2), r3=12(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 115
LDI r2, 174
LDI r3, 12
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
