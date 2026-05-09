; DESCRIPTION: Places a white line segment connecting (309, 24) to (12, 13).
; PLAN: r0=309(x1), r1=24(y1), r2=12(x2), r3=13(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 24
LDI r2, 12
LDI r3, 13
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
