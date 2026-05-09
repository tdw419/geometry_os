; DESCRIPTION: Draws a orange line from (482, 209) to (99, 163).
; PLAN: r0=482(x1), r1=209(y1), r2=99(x2), r3=163(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 209
LDI r2, 99
LDI r3, 163
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
