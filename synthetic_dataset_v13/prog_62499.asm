; DESCRIPTION: Draws a orange line from (97, 193) to (354, 164).
; PLAN: r0=97(x1), r1=193(y1), r2=354(x2), r3=164(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 193
LDI r2, 354
LDI r3, 164
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
