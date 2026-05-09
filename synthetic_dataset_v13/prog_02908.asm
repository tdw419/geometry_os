; DESCRIPTION: Places a red line segment connecting (179, 246) to (230, 239).
; PLAN: r0=179(x1), r1=246(y1), r2=230(x2), r3=239(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 246
LDI r2, 230
LDI r3, 239
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
