; DESCRIPTION: Draws a red line from (15, 215) to (436, 26).
; PLAN: r0=15(x1), r1=215(y1), r2=436(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 215
LDI r2, 436
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
