; DESCRIPTION: Draws a red line from (112, 48) to (415, 26).
; PLAN: r0=112(x1), r1=48(y1), r2=415(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 48
LDI r2, 415
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
