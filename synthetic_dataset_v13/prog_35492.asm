; DESCRIPTION: Renders a red line between points (173, 227) and (97, 13).
; PLAN: r0=173(x1), r1=227(y1), r2=97(x2), r3=13(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 227
LDI r2, 97
LDI r3, 13
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
