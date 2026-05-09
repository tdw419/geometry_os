; DESCRIPTION: Draws a red line from (16, 135) to (424, 240).
; PLAN: r0=16(x1), r1=135(y1), r2=424(x2), r3=240(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 135
LDI r2, 424
LDI r3, 240
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
