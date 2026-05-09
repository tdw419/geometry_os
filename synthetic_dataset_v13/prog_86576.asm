; DESCRIPTION: Renders a red line between points (492, 178) and (1, 33).
; PLAN: r0=492(x1), r1=178(y1), r2=1(x2), r3=33(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 178
LDI r2, 1
LDI r3, 33
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
