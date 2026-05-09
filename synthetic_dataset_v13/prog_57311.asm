; DESCRIPTION: Renders a red line between points (165, 35) and (337, 236).
; PLAN: r0=165(x1), r1=35(y1), r2=337(x2), r3=236(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 35
LDI r2, 337
LDI r3, 236
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
