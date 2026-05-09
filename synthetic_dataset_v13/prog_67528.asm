; DESCRIPTION: Draws a cyan line from (11, 251) to (272, 41).
; PLAN: r0=11(x1), r1=251(y1), r2=272(x2), r3=41(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 251
LDI r2, 272
LDI r3, 41
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
