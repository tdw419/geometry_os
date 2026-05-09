; DESCRIPTION: Draws a red line from (225, 24) to (44, 45).
; PLAN: r0=225(x1), r1=24(y1), r2=44(x2), r3=45(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 24
LDI r2, 44
LDI r3, 45
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
