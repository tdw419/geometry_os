; DESCRIPTION: Draws a red line from (111, 180) to (415, 116).
; PLAN: r0=111(x1), r1=180(y1), r2=415(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 180
LDI r2, 415
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
