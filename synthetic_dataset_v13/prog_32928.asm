; DESCRIPTION: Draws a red line from (96, 225) to (208, 39).
; PLAN: r0=96(x1), r1=225(y1), r2=208(x2), r3=39(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 225
LDI r2, 208
LDI r3, 39
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
