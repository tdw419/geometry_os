; DESCRIPTION: Draws a black line from (356, 39) to (187, 41).
; PLAN: r0=356(x1), r1=39(y1), r2=187(x2), r3=41(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 39
LDI r2, 187
LDI r3, 41
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
