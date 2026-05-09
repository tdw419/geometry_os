; DESCRIPTION: Draws a red line from (53, 31) to (117, 221).
; PLAN: r0=53(x1), r1=31(y1), r2=117(x2), r3=221(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 31
LDI r2, 117
LDI r3, 221
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
