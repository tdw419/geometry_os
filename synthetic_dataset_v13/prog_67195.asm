; DESCRIPTION: Draws a red line from (299, 6) to (104, 86).
; PLAN: r0=299(x1), r1=6(y1), r2=104(x2), r3=86(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 6
LDI r2, 104
LDI r3, 86
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
