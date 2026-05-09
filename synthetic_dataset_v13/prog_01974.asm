; DESCRIPTION: Places a red line segment connecting (378, 35) to (464, 175).
; PLAN: r0=378(x1), r1=35(y1), r2=464(x2), r3=175(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 35
LDI r2, 464
LDI r3, 175
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
