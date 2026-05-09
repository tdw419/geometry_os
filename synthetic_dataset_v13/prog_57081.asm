; DESCRIPTION: Draws a blue line from (275, 237) to (41, 36).
; PLAN: r0=275(x1), r1=237(y1), r2=41(x2), r3=36(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 237
LDI r2, 41
LDI r3, 36
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
