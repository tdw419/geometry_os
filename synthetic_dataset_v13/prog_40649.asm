; DESCRIPTION: Renders a red line between points (327, 169) and (320, 153).
; PLAN: r0=327(x1), r1=169(y1), r2=320(x2), r3=153(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 169
LDI r2, 320
LDI r3, 153
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
