; DESCRIPTION: Renders a red line between points (438, 155) and (415, 196).
; PLAN: r0=438(x1), r1=155(y1), r2=415(x2), r3=196(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 155
LDI r2, 415
LDI r3, 196
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
