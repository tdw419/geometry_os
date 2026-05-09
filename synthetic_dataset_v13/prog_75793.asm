; DESCRIPTION: Renders a red line between points (350, 66) and (492, 34).
; PLAN: r0=350(x1), r1=66(y1), r2=492(x2), r3=34(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 66
LDI r2, 492
LDI r3, 34
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
