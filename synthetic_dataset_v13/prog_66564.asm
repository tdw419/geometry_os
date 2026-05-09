; DESCRIPTION: Places a orange line segment connecting (315, 249) to (157, 166).
; PLAN: r0=315(x1), r1=249(y1), r2=157(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 249
LDI r2, 157
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
