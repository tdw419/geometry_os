; DESCRIPTION: Draws a orange line from (205, 249) to (333, 241).
; PLAN: r0=205(x1), r1=249(y1), r2=333(x2), r3=241(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 249
LDI r2, 333
LDI r3, 241
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
