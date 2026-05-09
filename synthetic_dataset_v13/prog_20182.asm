; DESCRIPTION: Draws a red line from (259, 118) to (284, 69).
; PLAN: r0=259(x1), r1=118(y1), r2=284(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 118
LDI r2, 284
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
