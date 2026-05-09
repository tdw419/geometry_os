; DESCRIPTION: Draws a orange line from (253, 181) to (398, 214).
; PLAN: r0=253(x1), r1=181(y1), r2=398(x2), r3=214(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 181
LDI r2, 398
LDI r3, 214
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
