; DESCRIPTION: Draws a red line from (240, 58) to (140, 126).
; PLAN: r0=240(x1), r1=58(y1), r2=140(x2), r3=126(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 58
LDI r2, 140
LDI r3, 126
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
