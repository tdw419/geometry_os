; DESCRIPTION: Places a red line segment connecting (52, 19) to (284, 217).
; PLAN: r0=52(x1), r1=19(y1), r2=284(x2), r3=217(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 19
LDI r2, 284
LDI r3, 217
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
