; DESCRIPTION: Renders a red line between points (405, 183) and (84, 127).
; PLAN: r0=405(x1), r1=183(y1), r2=84(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 183
LDI r2, 84
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
