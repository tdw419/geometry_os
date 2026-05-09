; DESCRIPTION: Renders a red line between points (234, 111) and (399, 0).
; PLAN: r0=234(x1), r1=111(y1), r2=399(x2), r3=0(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 111
LDI r2, 399
LDI r3, 0
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
