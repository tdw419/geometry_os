; DESCRIPTION: Renders a red line between points (305, 104) and (17, 195).
; PLAN: r0=305(x1), r1=104(y1), r2=17(x2), r3=195(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 104
LDI r2, 17
LDI r3, 195
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
