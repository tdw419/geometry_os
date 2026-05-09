; DESCRIPTION: Draws a red line from (373, 153) to (471, 125).
; PLAN: r0=373(x1), r1=153(y1), r2=471(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 153
LDI r2, 471
LDI r3, 125
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
