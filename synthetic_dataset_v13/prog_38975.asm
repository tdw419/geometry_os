; DESCRIPTION: Draws a red line from (271, 0) to (8, 115).
; PLAN: r0=271(x1), r1=0(y1), r2=8(x2), r3=115(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 0
LDI r2, 8
LDI r3, 115
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
