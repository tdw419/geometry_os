; DESCRIPTION: Places a red line segment connecting (319, 236) to (33, 137).
; PLAN: r0=319(x1), r1=236(y1), r2=33(x2), r3=137(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 236
LDI r2, 33
LDI r3, 137
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
