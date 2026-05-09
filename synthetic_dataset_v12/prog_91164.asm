; DESCRIPTION: Places a orange line segment connecting (98, 202) to (48, 115).
; PLAN: r0=98(x1), r1=202(y1), r2=48(x2), r3=115(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 202
LDI r2, 48
LDI r3, 115
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
