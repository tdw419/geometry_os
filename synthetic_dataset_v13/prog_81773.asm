; DESCRIPTION: Draws a red line from (180, 4) to (114, 189).
; PLAN: r0=180(x1), r1=4(y1), r2=114(x2), r3=189(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 4
LDI r2, 114
LDI r3, 189
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
