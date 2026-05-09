; DESCRIPTION: Draws a orange line from (444, 174) to (263, 187).
; PLAN: r0=444(x1), r1=174(y1), r2=263(x2), r3=187(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 174
LDI r2, 263
LDI r3, 187
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
