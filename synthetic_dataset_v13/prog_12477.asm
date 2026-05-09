; DESCRIPTION: Draws a orange line from (385, 16) to (425, 126).
; PLAN: r0=385(x1), r1=16(y1), r2=425(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 16
LDI r2, 425
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
