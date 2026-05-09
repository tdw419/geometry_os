; DESCRIPTION: Draws a orange line from (482, 76) to (415, 7).
; PLAN: r0=482(x1), r1=76(y1), r2=415(x2), r3=7(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 76
LDI r2, 415
LDI r3, 7
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
