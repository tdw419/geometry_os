; DESCRIPTION: Renders a red line between points (455, 2) and (127, 80).
; PLAN: r0=455(x1), r1=2(y1), r2=127(x2), r3=80(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 2
LDI r2, 127
LDI r3, 80
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
