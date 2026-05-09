; DESCRIPTION: Places a white line segment connecting (278, 91) to (186, 98).
; PLAN: r0=278(x1), r1=91(y1), r2=186(x2), r3=98(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 91
LDI r2, 186
LDI r3, 98
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
