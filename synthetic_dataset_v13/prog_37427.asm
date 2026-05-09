; DESCRIPTION: Renders a red line between points (437, 59) and (290, 114).
; PLAN: r0=437(x1), r1=59(y1), r2=290(x2), r3=114(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 59
LDI r2, 290
LDI r3, 114
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
