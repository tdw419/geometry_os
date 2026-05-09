; DESCRIPTION: Renders a yellow line between points (54, 36) and (174, 54).
; PLAN: r0=54(x1), r1=36(y1), r2=174(x2), r3=54(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 36
LDI r2, 174
LDI r3, 54
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
