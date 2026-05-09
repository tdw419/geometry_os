; DESCRIPTION: Draws a orange line from (109, 222) to (346, 23).
; PLAN: r0=109(x1), r1=222(y1), r2=346(x2), r3=23(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 222
LDI r2, 346
LDI r3, 23
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
