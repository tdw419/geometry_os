; DESCRIPTION: Draws a red line from (98, 39) to (104, 160).
; PLAN: r0=98(x1), r1=39(y1), r2=104(x2), r3=160(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 39
LDI r2, 104
LDI r3, 160
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
