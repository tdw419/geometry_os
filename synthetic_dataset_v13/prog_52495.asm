; DESCRIPTION: Renders a red line between points (176, 22) and (17, 173).
; PLAN: r0=176(x1), r1=22(y1), r2=17(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 22
LDI r2, 17
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
