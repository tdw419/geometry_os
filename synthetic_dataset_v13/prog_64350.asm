; DESCRIPTION: Places a white line segment connecting (79, 115) to (303, 203).
; PLAN: r0=79(x1), r1=115(y1), r2=303(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 115
LDI r2, 303
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
