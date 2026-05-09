; DESCRIPTION: Draws a red line from (174, 4) to (208, 170).
; PLAN: r0=174(x1), r1=4(y1), r2=208(x2), r3=170(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 4
LDI r2, 208
LDI r3, 170
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
