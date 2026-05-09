; DESCRIPTION: Draws a red line from (286, 233) to (415, 196).
; PLAN: r0=286(x1), r1=233(y1), r2=415(x2), r3=196(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 233
LDI r2, 415
LDI r3, 196
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
