; DESCRIPTION: Draws a orange line from (9, 207) to (445, 128).
; PLAN: r0=9(x1), r1=207(y1), r2=445(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 207
LDI r2, 445
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
