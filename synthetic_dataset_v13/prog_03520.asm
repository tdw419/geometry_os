; DESCRIPTION: Draws a red line from (252, 179) to (430, 239).
; PLAN: r0=252(x1), r1=179(y1), r2=430(x2), r3=239(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 179
LDI r2, 430
LDI r3, 239
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
