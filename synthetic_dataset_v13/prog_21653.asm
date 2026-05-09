; DESCRIPTION: Draws a orange line from (350, 173) to (167, 13).
; PLAN: r0=350(x1), r1=173(y1), r2=167(x2), r3=13(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 173
LDI r2, 167
LDI r3, 13
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
