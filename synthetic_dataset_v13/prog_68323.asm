; DESCRIPTION: Draws a red line from (17, 151) to (1, 231).
; PLAN: r0=17(x1), r1=151(y1), r2=1(x2), r3=231(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 151
LDI r2, 1
LDI r3, 231
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
