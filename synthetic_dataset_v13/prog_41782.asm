; DESCRIPTION: Draws a red line from (298, 94) to (85, 157).
; PLAN: r0=298(x1), r1=94(y1), r2=85(x2), r3=157(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 94
LDI r2, 85
LDI r3, 157
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
