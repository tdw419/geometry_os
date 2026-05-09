; DESCRIPTION: Renders a white line between points (383, 2) and (91, 75).
; PLAN: r0=383(x1), r1=2(y1), r2=91(x2), r3=75(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 2
LDI r2, 91
LDI r3, 75
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
