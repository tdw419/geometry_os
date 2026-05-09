; DESCRIPTION: Places a red line segment connecting (316, 222) to (329, 236).
; PLAN: r0=316(x1), r1=222(y1), r2=329(x2), r3=236(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 222
LDI r2, 329
LDI r3, 236
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
