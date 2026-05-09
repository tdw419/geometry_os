; DESCRIPTION: Draws a red line from (506, 184) to (111, 52).
; PLAN: r0=506(x1), r1=184(y1), r2=111(x2), r3=52(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 184
LDI r2, 111
LDI r3, 52
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
