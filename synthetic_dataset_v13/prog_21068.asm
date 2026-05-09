; DESCRIPTION: Draws a red line from (157, 247) to (328, 240).
; PLAN: r0=157(x1), r1=247(y1), r2=328(x2), r3=240(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 247
LDI r2, 328
LDI r3, 240
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
