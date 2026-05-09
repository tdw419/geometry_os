; DESCRIPTION: Places a white line segment connecting (386, 241) to (26, 135).
; PLAN: r0=386(x1), r1=241(y1), r2=26(x2), r3=135(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 241
LDI r2, 26
LDI r3, 135
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
