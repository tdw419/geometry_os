; DESCRIPTION: Renders a orange line between points (445, 109) and (270, 246).
; PLAN: r0=445(x1), r1=109(y1), r2=270(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 109
LDI r2, 270
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
