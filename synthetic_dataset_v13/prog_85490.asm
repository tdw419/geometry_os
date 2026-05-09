; DESCRIPTION: Draws a orange line from (261, 193) to (487, 220).
; PLAN: r0=261(x1), r1=193(y1), r2=487(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 193
LDI r2, 487
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
