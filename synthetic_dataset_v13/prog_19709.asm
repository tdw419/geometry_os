; DESCRIPTION: Places a red line segment connecting (225, 2) to (125, 172).
; PLAN: r0=225(x1), r1=2(y1), r2=125(x2), r3=172(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 2
LDI r2, 125
LDI r3, 172
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
