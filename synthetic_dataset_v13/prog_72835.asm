; DESCRIPTION: Draws a red line from (315, 168) to (418, 94).
; PLAN: r0=315(x1), r1=168(y1), r2=418(x2), r3=94(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 168
LDI r2, 418
LDI r3, 94
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
