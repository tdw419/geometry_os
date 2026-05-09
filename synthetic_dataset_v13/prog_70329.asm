; DESCRIPTION: Renders a red line between points (56, 90) and (386, 248).
; PLAN: r0=56(x1), r1=90(y1), r2=386(x2), r3=248(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 90
LDI r2, 386
LDI r3, 248
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
