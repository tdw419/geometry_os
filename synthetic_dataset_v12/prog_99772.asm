; DESCRIPTION: Places a red line segment connecting (271, 117) to (266, 103).
; PLAN: r0=271(x1), r1=117(y1), r2=266(x2), r3=103(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 117
LDI r2, 266
LDI r3, 103
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
