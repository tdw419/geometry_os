; DESCRIPTION: Draws a red line from (426, 60) to (225, 178).
; PLAN: r0=426(x1), r1=60(y1), r2=225(x2), r3=178(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 60
LDI r2, 225
LDI r3, 178
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
