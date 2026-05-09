; DESCRIPTION: Draws a red line from (375, 196) to (17, 182).
; PLAN: r0=375(x1), r1=196(y1), r2=17(x2), r3=182(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 196
LDI r2, 17
LDI r3, 182
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
