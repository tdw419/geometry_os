; DESCRIPTION: Draws a orange line from (98, 4) to (504, 173).
; PLAN: r0=98(x1), r1=4(y1), r2=504(x2), r3=173(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 4
LDI r2, 504
LDI r3, 173
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
