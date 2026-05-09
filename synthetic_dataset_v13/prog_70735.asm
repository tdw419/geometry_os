; DESCRIPTION: Places a red line segment connecting (15, 82) to (17, 193).
; PLAN: r0=15(x1), r1=82(y1), r2=17(x2), r3=193(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 82
LDI r2, 17
LDI r3, 193
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
