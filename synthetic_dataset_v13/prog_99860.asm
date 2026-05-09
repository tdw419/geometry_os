; DESCRIPTION: Places a yellow line segment connecting (306, 74) to (404, 130).
; PLAN: r0=306(x1), r1=74(y1), r2=404(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 74
LDI r2, 404
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
