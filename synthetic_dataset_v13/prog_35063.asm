; DESCRIPTION: Places a green line segment connecting (303, 25) to (79, 72).
; PLAN: r0=303(x1), r1=25(y1), r2=79(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 25
LDI r2, 79
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
