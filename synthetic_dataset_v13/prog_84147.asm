; DESCRIPTION: Renders a red line between points (170, 10) and (340, 178).
; PLAN: r0=170(x1), r1=10(y1), r2=340(x2), r3=178(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 10
LDI r2, 340
LDI r3, 178
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
