; DESCRIPTION: Draws a red line from (273, 80) to (17, 221).
; PLAN: r0=273(x1), r1=80(y1), r2=17(x2), r3=221(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 80
LDI r2, 17
LDI r3, 221
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
