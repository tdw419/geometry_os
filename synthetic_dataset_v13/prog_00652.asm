; DESCRIPTION: Draws a red line from (418, 154) to (49, 36).
; PLAN: r0=418(x1), r1=154(y1), r2=49(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 154
LDI r2, 49
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
