; DESCRIPTION: Draws a orange line from (143, 162) to (482, 134).
; PLAN: r0=143(x1), r1=162(y1), r2=482(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 162
LDI r2, 482
LDI r3, 134
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
