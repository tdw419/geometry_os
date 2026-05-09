; DESCRIPTION: Draws a black line from (41, 195) to (294, 63).
; PLAN: r0=41(x1), r1=195(y1), r2=294(x2), r3=63(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 195
LDI r2, 294
LDI r3, 63
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
