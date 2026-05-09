; DESCRIPTION: Renders a red line between points (280, 114) and (54, 37).
; PLAN: r0=280(x1), r1=114(y1), r2=54(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 114
LDI r2, 54
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
