; DESCRIPTION: Draws a orange line from (290, 211) to (285, 28).
; PLAN: r0=290(x1), r1=211(y1), r2=285(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 211
LDI r2, 285
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
