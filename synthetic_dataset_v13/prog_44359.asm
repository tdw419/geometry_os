; DESCRIPTION: Draws a green line from (454, 41) to (234, 219).
; PLAN: r0=454(x1), r1=41(y1), r2=234(x2), r3=219(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 41
LDI r2, 234
LDI r3, 219
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
