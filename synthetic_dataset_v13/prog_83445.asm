; DESCRIPTION: Places a red line segment connecting (138, 45) to (276, 206).
; PLAN: r0=138(x1), r1=45(y1), r2=276(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 45
LDI r2, 276
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
