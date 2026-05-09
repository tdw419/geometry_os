; DESCRIPTION: Draws a red line from (492, 17) to (500, 39).
; PLAN: r0=492(x1), r1=17(y1), r2=500(x2), r3=39(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 17
LDI r2, 500
LDI r3, 39
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
