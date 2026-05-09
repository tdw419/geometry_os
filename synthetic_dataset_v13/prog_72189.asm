; DESCRIPTION: Draws a green line from (41, 218) to (2, 166).
; PLAN: r0=41(x1), r1=218(y1), r2=2(x2), r3=166(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 218
LDI r2, 2
LDI r3, 166
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
