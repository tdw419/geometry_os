; DESCRIPTION: Places a white line segment connecting (209, 3) to (93, 127).
; PLAN: r0=209(x1), r1=3(y1), r2=93(x2), r3=127(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 3
LDI r2, 93
LDI r3, 127
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
