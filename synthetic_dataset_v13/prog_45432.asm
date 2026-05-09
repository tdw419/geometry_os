; DESCRIPTION: Draws a red line from (321, 81) to (50, 174).
; PLAN: r0=321(x1), r1=81(y1), r2=50(x2), r3=174(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 81
LDI r2, 50
LDI r3, 174
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
