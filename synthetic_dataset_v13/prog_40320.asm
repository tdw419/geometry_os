; DESCRIPTION: Renders a red line between points (466, 12) and (91, 40).
; PLAN: r0=466(x1), r1=12(y1), r2=91(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 12
LDI r2, 91
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
