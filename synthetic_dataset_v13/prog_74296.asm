; DESCRIPTION: Draws a orange line from (367, 7) to (136, 213).
; PLAN: r0=367(x1), r1=7(y1), r2=136(x2), r3=213(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 7
LDI r2, 136
LDI r3, 213
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
