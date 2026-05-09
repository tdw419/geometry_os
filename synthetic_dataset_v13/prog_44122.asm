; DESCRIPTION: Draws a orange line from (467, 103) to (112, 210).
; PLAN: r0=467(x1), r1=103(y1), r2=112(x2), r3=210(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 103
LDI r2, 112
LDI r3, 210
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
