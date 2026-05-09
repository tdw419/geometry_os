; DESCRIPTION: Draws a red line from (153, 151) to (132, 225).
; PLAN: r0=153(x1), r1=151(y1), r2=132(x2), r3=225(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 151
LDI r2, 132
LDI r3, 225
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
