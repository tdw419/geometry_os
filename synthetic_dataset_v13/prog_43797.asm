; DESCRIPTION: Draws a red line from (441, 240) to (346, 230).
; PLAN: r0=441(x1), r1=240(y1), r2=346(x2), r3=230(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 240
LDI r2, 346
LDI r3, 230
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
