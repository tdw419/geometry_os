; DESCRIPTION: Draws a orange line from (75, 173) to (495, 90).
; PLAN: r0=75(x1), r1=173(y1), r2=495(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 173
LDI r2, 495
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
