; DESCRIPTION: Draws a red line from (482, 132) to (497, 82).
; PLAN: r0=482(x1), r1=132(y1), r2=497(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 132
LDI r2, 497
LDI r3, 82
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
