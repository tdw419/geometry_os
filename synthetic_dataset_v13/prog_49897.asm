; DESCRIPTION: Draws a red line from (40, 229) to (193, 46).
; PLAN: r0=40(x1), r1=229(y1), r2=193(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 229
LDI r2, 193
LDI r3, 46
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
