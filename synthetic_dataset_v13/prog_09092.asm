; DESCRIPTION: Draws a orange line from (372, 140) to (393, 60).
; PLAN: r0=372(x1), r1=140(y1), r2=393(x2), r3=60(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 140
LDI r2, 393
LDI r3, 60
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
