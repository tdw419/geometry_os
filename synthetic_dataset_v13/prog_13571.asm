; DESCRIPTION: Draws a yellow line from (107, 39) to (367, 122).
; PLAN: r0=107(x1), r1=39(y1), r2=367(x2), r3=122(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 39
LDI r2, 367
LDI r3, 122
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
