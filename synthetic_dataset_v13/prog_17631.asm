; DESCRIPTION: Draws a cyan line from (448, 41) to (352, 142).
; PLAN: r0=448(x1), r1=41(y1), r2=352(x2), r3=142(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 41
LDI r2, 352
LDI r3, 142
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
