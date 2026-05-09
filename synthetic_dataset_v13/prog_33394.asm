; DESCRIPTION: Draws a red line from (281, 173) to (376, 233).
; PLAN: r0=281(x1), r1=173(y1), r2=376(x2), r3=233(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 173
LDI r2, 376
LDI r3, 233
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
