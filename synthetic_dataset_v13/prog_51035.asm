; DESCRIPTION: Draws a red line from (215, 246) to (47, 150).
; PLAN: r0=215(x1), r1=246(y1), r2=47(x2), r3=150(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 246
LDI r2, 47
LDI r3, 150
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
