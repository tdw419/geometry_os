; DESCRIPTION: Renders a red line between points (165, 174) and (38, 239).
; PLAN: r0=165(x1), r1=174(y1), r2=38(x2), r3=239(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 174
LDI r2, 38
LDI r3, 239
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
