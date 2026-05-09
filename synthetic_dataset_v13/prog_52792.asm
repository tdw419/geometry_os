; DESCRIPTION: Places a green line segment connecting (47, 178) to (268, 9).
; PLAN: r0=47(x1), r1=178(y1), r2=268(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 178
LDI r2, 268
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
