; DESCRIPTION: Draws a cyan line from (317, 41) to (381, 20).
; PLAN: r0=317(x1), r1=41(y1), r2=381(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 41
LDI r2, 381
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
