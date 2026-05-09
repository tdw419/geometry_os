; DESCRIPTION: Draws a yellow line from (306, 90) to (290, 40).
; PLAN: r0=306(x1), r1=90(y1), r2=290(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 90
LDI r2, 290
LDI r3, 40
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
