; DESCRIPTION: Draws a red line from (174, 150) to (110, 159).
; PLAN: r0=174(x1), r1=150(y1), r2=110(x2), r3=159(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 150
LDI r2, 110
LDI r3, 159
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
