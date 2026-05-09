; DESCRIPTION: Renders a red line between points (28, 234) and (144, 194).
; PLAN: r0=28(x1), r1=234(y1), r2=144(x2), r3=194(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 234
LDI r2, 144
LDI r3, 194
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
