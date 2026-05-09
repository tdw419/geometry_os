; DESCRIPTION: Draws a yellow line from (375, 20) to (334, 126).
; PLAN: r0=375(x1), r1=20(y1), r2=334(x2), r3=126(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 20
LDI r2, 334
LDI r3, 126
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
