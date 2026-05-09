; DESCRIPTION: Places a red line segment connecting (8, 18) to (441, 236).
; PLAN: r0=8(x1), r1=18(y1), r2=441(x2), r3=236(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 18
LDI r2, 441
LDI r3, 236
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
