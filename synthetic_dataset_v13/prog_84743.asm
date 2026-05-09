; DESCRIPTION: Draws a red line from (77, 186) to (17, 251).
; PLAN: r0=77(x1), r1=186(y1), r2=17(x2), r3=251(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 186
LDI r2, 17
LDI r3, 251
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
