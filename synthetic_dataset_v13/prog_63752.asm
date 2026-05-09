; DESCRIPTION: Draws a white line from (115, 100) to (91, 24).
; PLAN: r0=115(x1), r1=100(y1), r2=91(x2), r3=24(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 100
LDI r2, 91
LDI r3, 24
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
