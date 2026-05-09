; DESCRIPTION: Renders a yellow line between points (240, 90) and (54, 170).
; PLAN: r0=240(x1), r1=90(y1), r2=54(x2), r3=170(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 90
LDI r2, 54
LDI r3, 170
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
