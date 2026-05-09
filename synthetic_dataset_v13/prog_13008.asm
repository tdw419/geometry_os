; DESCRIPTION: Renders a red line between points (173, 222) and (176, 41).
; PLAN: r0=173(x1), r1=222(y1), r2=176(x2), r3=41(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 222
LDI r2, 176
LDI r3, 41
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
