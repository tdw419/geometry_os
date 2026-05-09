; DESCRIPTION: Draws a red line from (103, 225) to (426, 0).
; PLAN: r0=103(x1), r1=225(y1), r2=426(x2), r3=0(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 225
LDI r2, 426
LDI r3, 0
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
