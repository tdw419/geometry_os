; DESCRIPTION: Renders a red line between points (173, 10) and (492, 26).
; PLAN: r0=173(x1), r1=10(y1), r2=492(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 10
LDI r2, 492
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
