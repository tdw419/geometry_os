; DESCRIPTION: Renders a red line between points (17, 151) and (305, 137).
; PLAN: r0=17(x1), r1=151(y1), r2=305(x2), r3=137(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 151
LDI r2, 305
LDI r3, 137
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
