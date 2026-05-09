; DESCRIPTION: Draws a yellow line from (415, 171) to (424, 78).
; PLAN: r0=415(x1), r1=171(y1), r2=424(x2), r3=78(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 171
LDI r2, 424
LDI r3, 78
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
