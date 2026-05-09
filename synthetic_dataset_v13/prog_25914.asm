; DESCRIPTION: Places a white line segment connecting (292, 134) to (211, 150).
; PLAN: r0=292(x1), r1=134(y1), r2=211(x2), r3=150(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 134
LDI r2, 211
LDI r3, 150
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
