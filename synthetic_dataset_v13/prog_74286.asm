; DESCRIPTION: Draws a orange line from (209, 37) to (281, 110).
; PLAN: r0=209(x1), r1=37(y1), r2=281(x2), r3=110(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 37
LDI r2, 281
LDI r3, 110
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
