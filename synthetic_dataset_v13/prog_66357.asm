; DESCRIPTION: Draws a red line from (407, 219) to (460, 39).
; PLAN: r0=407(x1), r1=219(y1), r2=460(x2), r3=39(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 219
LDI r2, 460
LDI r3, 39
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
