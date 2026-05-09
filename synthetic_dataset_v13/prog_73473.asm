; DESCRIPTION: Renders a red line between points (300, 227) and (492, 166).
; PLAN: r0=300(x1), r1=227(y1), r2=492(x2), r3=166(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 227
LDI r2, 492
LDI r3, 166
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
