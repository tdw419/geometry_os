; DESCRIPTION: Draws a orange line from (229, 98) to (426, 243).
; PLAN: r0=229(x1), r1=98(y1), r2=426(x2), r3=243(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 98
LDI r2, 426
LDI r3, 243
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
