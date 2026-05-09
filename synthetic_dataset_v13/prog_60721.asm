; DESCRIPTION: Draws a red line from (313, 10) to (110, 143).
; PLAN: r0=313(x1), r1=10(y1), r2=110(x2), r3=143(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 10
LDI r2, 110
LDI r3, 143
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
