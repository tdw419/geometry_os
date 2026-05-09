; DESCRIPTION: Places a white line segment connecting (303, 166) to (411, 205).
; PLAN: r0=303(x1), r1=166(y1), r2=411(x2), r3=205(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 166
LDI r2, 411
LDI r3, 205
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
