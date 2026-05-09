; DESCRIPTION: Draws a red line from (225, 214) to (95, 176).
; PLAN: r0=225(x1), r1=214(y1), r2=95(x2), r3=176(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 214
LDI r2, 95
LDI r3, 176
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
