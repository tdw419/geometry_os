; DESCRIPTION: Places a white line segment connecting (205, 187) to (81, 17).
; PLAN: r0=205(x1), r1=187(y1), r2=81(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 187
LDI r2, 81
LDI r3, 17
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
