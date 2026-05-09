; DESCRIPTION: Draws a green line from (222, 186) to (17, 93).
; PLAN: r0=222(x1), r1=186(y1), r2=17(x2), r3=93(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 186
LDI r2, 17
LDI r3, 93
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
