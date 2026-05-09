; DESCRIPTION: Places a orange line segment connecting (175, 177) to (386, 199).
; PLAN: r0=175(x1), r1=177(y1), r2=386(x2), r3=199(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 177
LDI r2, 386
LDI r3, 199
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
